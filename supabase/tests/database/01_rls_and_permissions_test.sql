-- pgTAP: RLS tenant isolation + queue write lockdown + SECURITY DEFINER exec lockdown
-- Run with: npx supabase test db

begin;
select plan(31);

-- ---------------------------------------------------------------------------
-- fixtures (as superuser)
-- ---------------------------------------------------------------------------
insert into auth.users (id, instance_id, aud, role, email, encrypted_password, created_at, updated_at)
values
  ('aaaaaaaa-0000-0000-0000-00000000000a', '00000000-0000-0000-0000-000000000000',
   'authenticated', 'authenticated', 'rls-a@test.dev', '', now(), now()),
  ('bbbbbbbb-0000-0000-0000-00000000000b', '00000000-0000-0000-0000-000000000000',
   'authenticated', 'authenticated', 'rls-b@test.dev', '', now(), now());

insert into public.expense_category (id, user_id, name) values
  ('c0000000-0000-4000-8000-00000000000a', 'aaaaaaaa-0000-0000-0000-00000000000a', 'A-cat'),
  ('c0000000-0000-4000-8000-00000000000b', 'bbbbbbbb-0000-0000-0000-00000000000b', 'B-cat');

insert into public.expense (id, user_id, title, amount, memo, local_date) values
  ('e0000000-0000-4000-8000-00000000000a', 'aaaaaaaa-0000-0000-0000-00000000000a', 'A-exp', 100, '', date '2026-01-01'),
  ('e0000000-0000-4000-8000-00000000000b', 'bbbbbbbb-0000-0000-0000-00000000000b', 'B-exp', 200, '', date '2026-01-01');

insert into public.expense_schedule (id, user_id, title, amount, memo, timezone) values
  ('50000000-0000-4000-8000-00000000000b', 'bbbbbbbb-0000-0000-0000-00000000000b', 'B-sch', 200, '', 'Asia/Tokyo');
insert into public.income_schedule (id, user_id, amount, memo, timezone) values
  ('51000000-0000-4000-8000-00000000000b', 'bbbbbbbb-0000-0000-0000-00000000000b', 300, '', 'Asia/Tokyo');
-- queue rows seeded by the AFTER INSERT trigger

-- =========================================================================
-- RLS: acting as user A
-- =========================================================================
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"aaaaaaaa-0000-0000-0000-00000000000a","role":"authenticated"}', true);

select is(
  (select count(*)::int from public.expense_category),
  1, 'RLS: A sees only its own expense_category rows');

select is(
  (select count(*)::int from public.expense_category where user_id = 'bbbbbbbb-0000-0000-0000-00000000000b'),
  0, 'RLS: B''s expense_category row is invisible to A');

select is(
  (select count(*)::int from public.expense),
  1, 'RLS: A sees only its own expense rows');

select is(
  (select string_agg(name, ',') from public.expense_category),
  'A-cat', 'RLS: the one visible category is A''s');

select lives_ok(
  $$ insert into public.expense_category (user_id, name)
     values ('aaaaaaaa-0000-0000-0000-00000000000a', 'A-cat-2') $$,
  'RLS: A can INSERT a row it owns');

select throws_ok(
  $$ insert into public.expense_category (user_id, name)
     values ('bbbbbbbb-0000-0000-0000-00000000000b', 'spoof') $$,
  '42501', null,
  'RLS: A cannot INSERT a row owned by B');

select throws_ok(
  $$ insert into public.expense (user_id, title, amount, memo, local_date)
     values ('bbbbbbbb-0000-0000-0000-00000000000b', 'spoof', 1, '', date '2026-01-01') $$,
  '42501', null,
  'RLS: A cannot INSERT an expense owned by B');

select is_empty(
  $$ update public.expense_category set name = 'hacked'
     where user_id = 'bbbbbbbb-0000-0000-0000-00000000000b' returning 1 $$,
  'RLS: A''s UPDATE targeting B''s row affects 0 rows');

select is_empty(
  $$ delete from public.expense where user_id = 'bbbbbbbb-0000-0000-0000-00000000000b' returning 1 $$,
  'RLS: A''s DELETE targeting B''s row affects 0 rows');

reset role;
select is(
  (select name from public.expense_category where id = 'c0000000-0000-4000-8000-00000000000b'),
  'B-cat', 'RLS: B''s row was never actually modified by A');

-- =========================================================================
-- Queue tables: authenticated has no INSERT / UPDATE / DELETE / TRUNCATE
-- =========================================================================
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"aaaaaaaa-0000-0000-0000-00000000000a","role":"authenticated"}', true);

select throws_ok(
  $$ insert into public.scheduled_expense_queue (expense_schedule_id, scheduled_at)
     values ('50000000-0000-4000-8000-00000000000b', now()) $$,
  '42501', null, 'queue: authenticated cannot INSERT scheduled_expense_queue');
select throws_ok(
  $$ update public.scheduled_expense_queue set scheduled_at = now() $$,
  '42501', null, 'queue: authenticated cannot UPDATE scheduled_expense_queue');
select throws_ok(
  $$ delete from public.scheduled_expense_queue $$,
  '42501', null, 'queue: authenticated cannot DELETE scheduled_expense_queue');
select throws_ok(
  $$ truncate public.scheduled_expense_queue $$,
  '42501', null, 'queue: authenticated cannot TRUNCATE scheduled_expense_queue');

select throws_ok(
  $$ insert into public.scheduled_income_queue (income_schedule_id, scheduled_at)
     values ('51000000-0000-4000-8000-00000000000b', now()) $$,
  '42501', null, 'queue: authenticated cannot INSERT scheduled_income_queue');
select throws_ok(
  $$ update public.scheduled_income_queue set scheduled_at = now() $$,
  '42501', null, 'queue: authenticated cannot UPDATE scheduled_income_queue');
select throws_ok(
  $$ delete from public.scheduled_income_queue $$,
  '42501', null, 'queue: authenticated cannot DELETE scheduled_income_queue');
select throws_ok(
  $$ truncate public.scheduled_income_queue $$,
  '42501', null, 'queue: authenticated cannot TRUNCATE scheduled_income_queue');

-- =========================================================================
-- Queue tables: anon has no INSERT / UPDATE / DELETE / TRUNCATE
-- =========================================================================
reset role;
set local role anon;

select throws_ok(
  $$ insert into public.scheduled_expense_queue (expense_schedule_id, scheduled_at)
     values ('50000000-0000-4000-8000-00000000000b', now()) $$,
  '42501', null, 'queue: anon cannot INSERT scheduled_expense_queue');
select throws_ok(
  $$ update public.scheduled_expense_queue set scheduled_at = now() $$,
  '42501', null, 'queue: anon cannot UPDATE scheduled_expense_queue');
select throws_ok(
  $$ delete from public.scheduled_expense_queue $$,
  '42501', null, 'queue: anon cannot DELETE scheduled_expense_queue');
select throws_ok(
  $$ truncate public.scheduled_expense_queue $$,
  '42501', null, 'queue: anon cannot TRUNCATE scheduled_expense_queue');
select throws_ok(
  $$ insert into public.scheduled_income_queue (income_schedule_id, scheduled_at)
     values ('51000000-0000-4000-8000-00000000000b', now()) $$,
  '42501', null, 'queue: anon cannot INSERT scheduled_income_queue');
select throws_ok(
  $$ update public.scheduled_income_queue set scheduled_at = now() $$,
  '42501', null, 'queue: anon cannot UPDATE scheduled_income_queue');
select throws_ok(
  $$ delete from public.scheduled_income_queue $$,
  '42501', null, 'queue: anon cannot DELETE scheduled_income_queue');
select throws_ok(
  $$ truncate public.scheduled_income_queue $$,
  '42501', null, 'queue: anon cannot TRUNCATE scheduled_income_queue');

-- =========================================================================
-- SECURITY DEFINER functions: no direct EXECUTE for anon / authenticated
-- =========================================================================
reset role;
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"aaaaaaaa-0000-0000-0000-00000000000a","role":"authenticated"}', true);

select throws_ok(
  $$ select public.enqueue_transaction_schedules() $$,
  '42501', null, 'definer: authenticated cannot EXECUTE enqueue_transaction_schedules()');
select throws_ok(
  $$ select public.create_transactions_from_queue() $$,
  '42501', null, 'definer: authenticated cannot EXECUTE create_transactions_from_queue()');
select throws_ok(
  $$ select public.trg_enqueue_after_schedule_insert() $$,
  '42501', null, 'definer: authenticated cannot EXECUTE trg_enqueue_after_schedule_insert()');

reset role;
set local role anon;
select throws_ok(
  $$ select public.enqueue_transaction_schedules() $$,
  '42501', null, 'definer: anon cannot EXECUTE enqueue_transaction_schedules()');
select throws_ok(
  $$ select public.create_transactions_from_queue() $$,
  '42501', null, 'definer: anon cannot EXECUTE create_transactions_from_queue()');

reset role;
select * from finish();
rollback;
