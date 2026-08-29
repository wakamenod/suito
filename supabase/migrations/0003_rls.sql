-- Phase 1 / 0003_rls.sql
-- Row-level security. This is the full replacement for the Go backend's
-- `WHERE uid = ?` tenant scoping.
--
-- Domain tables: RLS enabled, one policy per command, all keyed on
--   user_id = (select auth.uid())
-- The `(select ...)` wrapper lets Postgres treat auth.uid() as an initplan
-- constant instead of re-evaluating it per row (Supabase-recommended).
--
-- Queue tables: clients get SELECT only, gated through the parent schedule.
-- INSERT / UPDATE / DELETE are revoked from anon + authenticated -- only the
-- Phase 2 SECURITY DEFINER functions (owned by postgres) write these rows.

-- ===========================================================================
-- Domain tables
-- ===========================================================================
alter table public.expense_category  enable row level security;
alter table public.expense_location  enable row level security;
alter table public.income_type       enable row level security;
alter table public.expense           enable row level security;
alter table public.income            enable row level security;
alter table public.expense_schedule  enable row level security;
alter table public.income_schedule   enable row level security;

-- expense_category
create policy expense_category_select on public.expense_category
  for select to authenticated using (user_id = (select auth.uid()));
create policy expense_category_insert on public.expense_category
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy expense_category_update on public.expense_category
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy expense_category_delete on public.expense_category
  for delete to authenticated using (user_id = (select auth.uid()));

-- expense_location
create policy expense_location_select on public.expense_location
  for select to authenticated using (user_id = (select auth.uid()));
create policy expense_location_insert on public.expense_location
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy expense_location_update on public.expense_location
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy expense_location_delete on public.expense_location
  for delete to authenticated using (user_id = (select auth.uid()));

-- income_type
create policy income_type_select on public.income_type
  for select to authenticated using (user_id = (select auth.uid()));
create policy income_type_insert on public.income_type
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy income_type_update on public.income_type
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy income_type_delete on public.income_type
  for delete to authenticated using (user_id = (select auth.uid()));

-- expense
create policy expense_select on public.expense
  for select to authenticated using (user_id = (select auth.uid()));
create policy expense_insert on public.expense
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy expense_update on public.expense
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy expense_delete on public.expense
  for delete to authenticated using (user_id = (select auth.uid()));

-- income
create policy income_select on public.income
  for select to authenticated using (user_id = (select auth.uid()));
create policy income_insert on public.income
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy income_update on public.income
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy income_delete on public.income
  for delete to authenticated using (user_id = (select auth.uid()));

-- expense_schedule
create policy expense_schedule_select on public.expense_schedule
  for select to authenticated using (user_id = (select auth.uid()));
create policy expense_schedule_insert on public.expense_schedule
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy expense_schedule_update on public.expense_schedule
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy expense_schedule_delete on public.expense_schedule
  for delete to authenticated using (user_id = (select auth.uid()));

-- income_schedule
create policy income_schedule_select on public.income_schedule
  for select to authenticated using (user_id = (select auth.uid()));
create policy income_schedule_insert on public.income_schedule
  for insert to authenticated with check (user_id = (select auth.uid()));
create policy income_schedule_update on public.income_schedule
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy income_schedule_delete on public.income_schedule
  for delete to authenticated using (user_id = (select auth.uid()));

-- ===========================================================================
-- Queue tables: SELECT-only for clients, via the parent schedule.
-- ===========================================================================
alter table public.scheduled_expense_queue enable row level security;
alter table public.scheduled_income_queue  enable row level security;

create policy scheduled_expense_queue_select on public.scheduled_expense_queue
  for select to authenticated
  using (exists (
    select 1 from public.expense_schedule s
    where s.id = scheduled_expense_queue.expense_schedule_id
      and s.user_id = (select auth.uid())
  ));

create policy scheduled_income_queue_select on public.scheduled_income_queue
  for select to authenticated
  using (exists (
    select 1 from public.income_schedule s
    where s.id = scheduled_income_queue.income_schedule_id
      and s.user_id = (select auth.uid())
  ));

-- Strip client write access. Supabase's default privileges grant full DML on
-- new public tables to anon/authenticated; undo that for the queues so the
-- only writers are the Phase 2 postgres-owned functions.
revoke insert, update, delete, truncate on public.scheduled_expense_queue from anon, authenticated;
revoke insert, update, delete, truncate on public.scheduled_income_queue  from anon, authenticated;
