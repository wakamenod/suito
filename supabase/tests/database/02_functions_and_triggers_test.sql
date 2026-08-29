-- pgTAP: recurring-transaction engine (triggers + functions) and aggregation RPCs
-- Run with: npx supabase test db

begin;
select plan(31);

-- ---------------------------------------------------------------------------
-- users:  S = schedule/engine + cascade   C = charts
-- ---------------------------------------------------------------------------
insert into auth.users (id, instance_id, aud, role, email, encrypted_password, created_at, updated_at)
values
  ('55555555-0000-0000-0000-00000000000e', '00000000-0000-0000-0000-000000000000',
   'authenticated', 'authenticated', 'engine@test.dev', '', now(), now()),
  ('cccccccc-0000-0000-0000-00000000000c', '00000000-0000-0000-0000-000000000000',
   'authenticated', 'authenticated', 'charts@test.dev', '', now(), now()),
  ('0f0f0f0f-0000-0000-0000-00000000000f', '00000000-0000-0000-0000-000000000000',
   'authenticated', 'authenticated', 'other@test.dev', '', now(), now());

insert into public.expense_category (id, user_id, name) values
  ('fc000000-0000-4000-8000-00000000000e', '55555555-0000-0000-0000-00000000000e', 'S-Food'),
  ('fc000000-0000-4000-8000-00000000000c', 'cccccccc-0000-0000-0000-00000000000c', 'Food'),
  ('dc000000-0000-4000-8000-00000000000c', 'cccccccc-0000-0000-0000-00000000000c', 'Rent'),
  ('fc000000-0000-4000-8000-00000000000f', '0f0f0f0f-0000-0000-0000-00000000000f', 'Other');
insert into public.expense_location (id, user_id, name) values
  ('a1000000-0000-4000-8000-00000000000c', 'cccccccc-0000-0000-0000-00000000000c', 'Store');
insert into public.income_type (id, user_id, name) values
  ('11000000-0000-4000-8000-00000000000c', 'cccccccc-0000-0000-0000-00000000000c', 'Salary');

-- =========================================================================
-- AFTER INSERT trigger: enqueue on schedule creation
-- =========================================================================
insert into public.expense_schedule (id, user_id, title, amount, memo, expense_category_id, timezone)
values ('e5000000-0000-4000-8000-00000000000e', '55555555-0000-0000-0000-00000000000e',
        'Rent bill', 1490, '', 'fc000000-0000-4000-8000-00000000000e', 'Asia/Tokyo');

select is(
  (select count(*)::int from public.scheduled_expense_queue
   where expense_schedule_id = 'e5000000-0000-4000-8000-00000000000e'),
  1, 'trigger: inserting an expense_schedule enqueues exactly one queue row');

select is(
  (select scheduled_at from public.scheduled_expense_queue
   where expense_schedule_id = 'e5000000-0000-4000-8000-00000000000e'),
  (date_trunc('month', (now() at time zone 'Asia/Tokyo') + interval '1 month')
    + interval '3 hours') at time zone 'Asia/Tokyo',
  'trigger: scheduled_at = 1st of next month 03:00 Asia/Tokyo, stored as UTC instant');

insert into public.income_schedule (id, user_id, income_type_id, amount, memo, timezone)
values ('51000000-0000-4000-8000-00000000000e', '55555555-0000-0000-0000-00000000000e',
        null, 300000, '', 'America/New_York');

select is(
  (select count(*)::int from public.scheduled_income_queue
   where income_schedule_id = '51000000-0000-4000-8000-00000000000e'),
  1, 'trigger: inserting an income_schedule enqueues exactly one queue row');

select is(
  (select scheduled_at from public.scheduled_income_queue
   where income_schedule_id = '51000000-0000-4000-8000-00000000000e'),
  (date_trunc('month', (now() at time zone 'America/New_York') + interval '1 month')
    + interval '3 hours') at time zone 'America/New_York',
  'trigger: income scheduled_at honours the schedule''s own timezone');

-- =========================================================================
-- enqueue_transaction_schedules(): idempotent
-- =========================================================================
select public.enqueue_transaction_schedules();
select is(
  (select count(*)::int from public.scheduled_expense_queue),
  1, 'enqueue: re-running inserts no duplicate expense queue rows');
select is(
  (select count(*)::int from public.scheduled_income_queue),
  1, 'enqueue: re-running inserts no duplicate income queue rows');

-- =========================================================================
-- create_transactions_from_queue(): materialize due rows, drop queue rows
-- =========================================================================
update public.scheduled_expense_queue set scheduled_at = timestamptz '2026-02-01 03:00:00+09'
  where expense_schedule_id = 'e5000000-0000-4000-8000-00000000000e';
update public.scheduled_income_queue set scheduled_at = timestamptz '2026-02-01 03:00:00-05'
  where income_schedule_id = '51000000-0000-4000-8000-00000000000e';

select public.create_transactions_from_queue();

select is(
  (select local_date from public.expense
   where user_id = '55555555-0000-0000-0000-00000000000e' and title = 'Rent bill'),
  date '2026-02-01', 'materialize: local_date = (scheduled_at AT TIME ZONE schedule.tz)::date');
select is(
  (select amount from public.expense
   where user_id = '55555555-0000-0000-0000-00000000000e' and title = 'Rent bill'),
  1490, 'materialize: amount copied from the schedule');
select is(
  (select expense_category_id from public.expense
   where user_id = '55555555-0000-0000-0000-00000000000e' and title = 'Rent bill'),
  'fc000000-0000-4000-8000-00000000000e'::uuid, 'materialize: category copied from the schedule');
select is(
  (select count(*)::int from public.scheduled_expense_queue),
  0, 'materialize: due expense queue rows are removed');

select is(
  (select local_date from public.income
   where user_id = '55555555-0000-0000-0000-00000000000e' and amount = 300000),
  date '2026-02-01', 'materialize: income local_date converted via schedule tz');
select is(
  (select count(*)::int from public.scheduled_income_queue),
  0, 'materialize: due income queue rows are removed');

-- =========================================================================
-- Aggregation RPCs (as user C)
-- =========================================================================
insert into public.expense (user_id, title, amount, memo, expense_category_id, expense_location_id, local_date) values
  ('cccccccc-0000-0000-0000-00000000000c', 'e1', 1000, '', 'fc000000-0000-4000-8000-00000000000c', 'a1000000-0000-4000-8000-00000000000c', date '2026-01-15'),
  ('cccccccc-0000-0000-0000-00000000000c', 'e2', 2000, '', 'fc000000-0000-4000-8000-00000000000c', null, date '2026-02-10'),
  ('cccccccc-0000-0000-0000-00000000000c', 'e3',  500, '', 'dc000000-0000-4000-8000-00000000000c', null, date '2026-02-20'),
  ('cccccccc-0000-0000-0000-00000000000c', 'e4-del', 9999, '', 'fc000000-0000-4000-8000-00000000000c', null, date '2026-02-01'),
  ('cccccccc-0000-0000-0000-00000000000c', 'e5-del', 4242, '', 'fc000000-0000-4000-8000-00000000000c', null, date '2025-12-05');
update public.expense set deleted_at = now()
  where user_id = 'cccccccc-0000-0000-0000-00000000000c' and title in ('e4-del', 'e5-del');
insert into public.income (user_id, income_type_id, amount, memo, local_date) values
  ('cccccccc-0000-0000-0000-00000000000c', '11000000-0000-4000-8000-00000000000c', 300000, '', date '2026-01-25');
-- other user's row that must never leak into C's aggregates
insert into public.expense (user_id, title, amount, memo, expense_category_id, local_date) values
  ('0f0f0f0f-0000-0000-0000-00000000000f', 'leak', 77777, '', 'fc000000-0000-4000-8000-00000000000f', date '2026-02-05');

set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"cccccccc-0000-0000-0000-00000000000c","role":"authenticated"}', true);

select results_eq(
  $$ select public.transaction_months() $$,
  $$ values ('2026-02'::text), ('2026-01'::text) $$,
  'transaction_months: distinct YYYY-MM across expense+income, newest first');
select is(
  (select count(*)::int from public.transaction_months() m where m = '2025-12'),
  0, 'transaction_months: a month present only via a soft-deleted row is excluded');

select is(
  (select amount from public.column_chart_data()
   where transaction_type = 'expense' and category_name = 'Food' and month = '2026-01'),
  1000::bigint, 'column_chart_data: expense Food 2026-01 = 1000');
select is(
  (select amount from public.column_chart_data()
   where transaction_type = 'expense' and category_name = 'Food' and month = '2026-02'),
  2000::bigint, 'column_chart_data: expense Food 2026-02 = 2000 (soft-deleted 9999 excluded)');
select is(
  (select amount from public.column_chart_data()
   where transaction_type = 'expense' and category_name = 'Rent' and month = '2026-02'),
  500::bigint, 'column_chart_data: expense Rent 2026-02 = 500');
select is(
  (select amount from public.column_chart_data()
   where transaction_type = 'income' and category_name = 'Salary' and month = '2026-01'),
  300000::bigint, 'column_chart_data: income Salary 2026-01 = 300000');
select is(
  (select coalesce(sum(amount), 0)::bigint from public.column_chart_data()),
  303500::bigint, 'column_chart_data: grand total excludes soft-deleted and other-user rows');
select is(
  (select count(*)::int from public.column_chart_data() where amount = 9999),
  0, 'column_chart_data: no bucket contains the soft-deleted amount');

select is(
  (select amount from public.pie_chart_data(date '2026-02-01', date '2026-03-01')
   where dimension = 'category' and name = 'Food'),
  2000::bigint, 'pie_chart_data(Feb): category Food = 2000');
select is(
  (select amount from public.pie_chart_data(date '2026-02-01', date '2026-03-01')
   where dimension = 'category' and name = 'Rent'),
  500::bigint, 'pie_chart_data(Feb): category Rent = 500');
select is(
  (select amount from public.pie_chart_data(date '2026-02-01', date '2026-03-01')
   where dimension = 'location' and name = ''),
  2500::bigint, 'pie_chart_data(Feb): null-location bucket = 2500');
select is(
  (select coalesce(sum(amount), 0)::bigint from public.pie_chart_data(date '2026-02-01', date '2026-03-01')
   where dimension = 'category'),
  2500::bigint, 'pie_chart_data(Feb): category total excludes soft-deleted + other user + out-of-range');
select is(
  (select amount from public.pie_chart_data(date '2026-01-01', date '2026-03-01')
   where dimension = 'location' and name = 'Store'),
  1000::bigint, 'pie_chart_data(Jan-Feb): location Store = 1000');

reset role;

-- =========================================================================
-- Cascade delete from auth.users
-- =========================================================================
-- leave a live queue row so its cascade is covered too
insert into public.expense_schedule (user_id, title, amount, memo, timezone)
values ('55555555-0000-0000-0000-00000000000e', 'fresh', 100, '', 'Asia/Tokyo');

select cmp_ok(
  (select count(*)::int from public.expense where user_id = '55555555-0000-0000-0000-00000000000e'),
  '>', 0, 'cascade: user S has domain rows before deletion');

delete from auth.users where id = '55555555-0000-0000-0000-00000000000e';

select is((select count(*)::int from public.expense          where user_id = '55555555-0000-0000-0000-00000000000e'), 0, 'cascade: expense rows gone');
select is((select count(*)::int from public.expense_schedule where user_id = '55555555-0000-0000-0000-00000000000e'), 0, 'cascade: expense_schedule rows gone');
select is((select count(*)::int from public.income_schedule  where user_id = '55555555-0000-0000-0000-00000000000e'), 0, 'cascade: income_schedule rows gone');
select is((select count(*)::int from public.scheduled_expense_queue), 0, 'cascade: scheduled_expense_queue emptied via schedule FK');
select is((select count(*)::int from public.scheduled_income_queue),  0, 'cascade: scheduled_income_queue emptied via schedule FK');

select * from finish();
rollback;
