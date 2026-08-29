-- Phase 2 / 0004_functions.sql
-- Server-side logic ported from the Go backend:
--   * app_config           -- single-row table for the forced-update check
--   * enqueue_transaction_schedules()   (was EnqueueExpenseSchedule / EnqueueIncomeSchedule)
--   * create_transactions_from_queue()  (was SuitoScheduleJobService.CreateTransactionsService)
--   * AFTER INSERT triggers on *_schedule (was the sync enqueue in CreateXxxScheduleService)
--   * column_chart_data() / pie_chart_data() / transaction_months()  (was chart_service.go + repos)
--
-- The two queue-manipulating functions are SECURITY DEFINER (owned by postgres)
-- so they can write the queue tables whose client DML was revoked in 0003. Both
-- pin `search_path` per the hardening requirement. EXECUTE is revoked from
-- PUBLIC (and anon/authenticated) -- only pg_cron (0005), the triggers, and
-- service_role call them.

-- ===========================================================================
-- app_config : one row, read by every client on launch (forced-update check).
-- ===========================================================================
create table public.app_config (
  id                   integer     primary key default 1 check (id = 1),
  latest_version       text        not null default '1.0.0',
  min_required_version text        not null default '1.0.0',
  updated_at           timestamptz not null default now()
);

insert into public.app_config (id) values (1);

create trigger set_updated_at before update on public.app_config
  for each row execute function public.set_updated_at();

alter table public.app_config enable row level security;

-- world-readable (anon + authenticated); writes only via service_role / Studio.
create policy app_config_read on public.app_config
  for select to anon, authenticated using (true);

grant select on public.app_config to anon, authenticated;
revoke insert, update, delete, truncate on public.app_config from anon, authenticated;

-- ===========================================================================
-- enqueue_transaction_schedules()
--
-- For every schedule that has no queue row yet, enqueue the next occurrence:
-- the 1st of next month at 03:00 in the schedule's own timezone, stored as the
-- equivalent UTC instant.
--
-- MySQL original:
--   CONVERT_TZ(
--     STR_TO_DATE(
--       DATE_FORMAT(
--         DATE_ADD(CONVERT_TZ(NOW(),'UTC',s.timezone), INTERVAL 1 MONTH),
--         '%Y-%m-01 03:00:00'),
--       '%Y-%m-%d %H:%i:%s'),
--     s.timezone, 'UTC')
--
-- Postgres: (now() AT TIME ZONE tz) yields local wall-clock; truncate to the
-- month, add a month and 3h, then (local_ts AT TIME ZONE tz) converts that wall
-- clock in `tz` back to a timestamptz (UTC instant).
-- ===========================================================================
create or replace function public.enqueue_transaction_schedules()
returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
begin
  insert into public.scheduled_expense_queue (expense_schedule_id, scheduled_at)
  select
    s.id,
    (date_trunc('month', (now() at time zone s.timezone) + interval '1 month')
      + interval '3 hours') at time zone s.timezone
  from public.expense_schedule s
  left join public.scheduled_expense_queue q on q.expense_schedule_id = s.id
  where q.expense_schedule_id is null
    and s.deleted_at is null;

  insert into public.scheduled_income_queue (income_schedule_id, scheduled_at)
  select
    s.id,
    (date_trunc('month', (now() at time zone s.timezone) + interval '1 month')
      + interval '3 hours') at time zone s.timezone
  from public.income_schedule s
  left join public.scheduled_income_queue q on q.income_schedule_id = s.id
  where q.income_schedule_id is null
    and s.deleted_at is null;
end;
$$;

revoke execute on function public.enqueue_transaction_schedules() from public, anon, authenticated;

-- ===========================================================================
-- create_transactions_from_queue()
--
-- Materialize every due queue row (scheduled_at < now()) into an expense/income
-- row and remove the queue row -- atomically, via DELETE ... RETURNING so the
-- set inserted is exactly the set deleted.
--
-- local_date = DATE(CONVERT_TZ(scheduled_at,'UTC',timezone))
--            = (scheduled_at AT TIME ZONE timezone)::date
-- ===========================================================================
create or replace function public.create_transactions_from_queue()
returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
begin
  with due as (
    delete from public.scheduled_expense_queue q
    using public.expense_schedule s
    where s.id = q.expense_schedule_id
      and q.scheduled_at < now()
    returning
      s.user_id,
      s.title,
      s.amount,
      s.memo,
      s.expense_location_id,
      s.expense_category_id,
      (q.scheduled_at at time zone s.timezone)::date as local_date
  )
  insert into public.expense
    (user_id, title, amount, memo, expense_location_id, expense_category_id, local_date)
  select
    user_id, title, amount, memo, expense_location_id, expense_category_id, local_date
  from due;

  with due as (
    delete from public.scheduled_income_queue q
    using public.income_schedule s
    where s.id = q.income_schedule_id
      and q.scheduled_at < now()
    returning
      s.user_id,
      s.income_type_id,
      s.amount,
      s.memo,
      (q.scheduled_at at time zone s.timezone)::date as local_date
  )
  insert into public.income
    (user_id, income_type_id, amount, memo, local_date)
  select
    user_id, income_type_id, amount, memo, local_date
  from due;
end;
$$;

revoke execute on function public.create_transactions_from_queue() from public, anon, authenticated;

-- ===========================================================================
-- AFTER INSERT triggers: a newly created schedule is enqueued immediately
-- (replaces the synchronous EnqueueXxxSchedule() call in the Go create path).
-- Statement-level: enqueue_transaction_schedules() already scans all pending
-- schedules, so one call per statement is enough.
-- ===========================================================================
create or replace function public.trg_enqueue_after_schedule_insert()
returns trigger
language plpgsql
security definer
set search_path = public, pg_temp
as $$
begin
  perform public.enqueue_transaction_schedules();
  return null;
end;
$$;

revoke execute on function public.trg_enqueue_after_schedule_insert() from public, anon, authenticated;

create trigger enqueue_after_insert
  after insert on public.expense_schedule
  for each statement execute function public.trg_enqueue_after_schedule_insert();

create trigger enqueue_after_insert
  after insert on public.income_schedule
  for each statement execute function public.trg_enqueue_after_schedule_insert();

-- ===========================================================================
-- Aggregation RPCs. SECURITY INVOKER so RLS scopes rows to the caller; the
-- explicit user_id filter also keeps them correct when called with service_role.
--
-- NOTE (behaviour change): the Go queries put `e.deleted_at IS NULL` in the
-- LEFT JOIN ... ON clause, so soft-deleted rows were still summed (just with a
-- blank category). That is treated as a bug -- these functions filter
-- deleted_at in WHERE, matching transaction_months() and the rest of the app.
-- ===========================================================================

-- transaction_months(): distinct 'YYYY-MM' across expense + income, newest first.
create or replace function public.transaction_months()
returns setof text
language sql
stable
security invoker
set search_path = public, pg_temp
as $$
  select to_char(local_date, 'YYYY-MM') as ym
  from public.expense
  where user_id = (select auth.uid()) and deleted_at is null
  union
  select to_char(local_date, 'YYYY-MM') as ym
  from public.income
  where user_id = (select auth.uid()) and deleted_at is null
  order by ym desc;
$$;

-- column_chart_data(): per-category monthly sums, expense and income together
-- (discriminated by transaction_type). Month-axis padding stays in Dart.
create or replace function public.column_chart_data(
  p_user_id uuid default auth.uid()
)
returns table (
  transaction_type text,
  category_name    text,
  month            text,
  amount           bigint
)
language sql
stable
security invoker
set search_path = public, pg_temp
as $$
  select
    'expense'::text,
    coalesce(ec.name, ''),
    to_char(e.local_date, 'YYYY-MM'),
    sum(e.amount)::bigint
  from public.expense e
  left join public.expense_category ec on ec.id = e.expense_category_id
  where e.user_id = p_user_id and e.deleted_at is null
  group by coalesce(ec.name, ''), to_char(e.local_date, 'YYYY-MM')
  union all
  select
    'income'::text,
    coalesce(it.name, ''),
    to_char(i.local_date, 'YYYY-MM'),
    sum(i.amount)::bigint
  from public.income i
  left join public.income_type it on it.id = i.income_type_id
  where i.user_id = p_user_id and i.deleted_at is null
  group by coalesce(it.name, ''), to_char(i.local_date, 'YYYY-MM')
  order by 1, 2 desc, 3 asc;
$$;

-- pie_chart_data(): expense sums for [p_start, p_end) grouped by category and
-- by location (discriminated by `dimension`).
create or replace function public.pie_chart_data(
  p_start   date,
  p_end     date,
  p_user_id uuid default auth.uid()
)
returns table (
  dimension text,
  name      text,
  amount    bigint
)
language sql
stable
security invoker
set search_path = public, pg_temp
as $$
  select
    'category'::text,
    coalesce(ec.name, ''),
    sum(e.amount)::bigint
  from public.expense e
  left join public.expense_category ec on ec.id = e.expense_category_id
  where e.user_id = p_user_id
    and e.deleted_at is null
    and e.local_date >= p_start
    and e.local_date <  p_end
  group by coalesce(ec.name, '')
  union all
  select
    'location'::text,
    coalesce(el.name, ''),
    sum(e.amount)::bigint
  from public.expense e
  left join public.expense_location el on el.id = e.expense_location_id
  where e.user_id = p_user_id
    and e.deleted_at is null
    and e.local_date >= p_start
    and e.local_date <  p_end
  group by coalesce(el.name, '')
  order by 1, 2 desc;
$$;
