-- pgTAP: the explicit Data API grants from 0006_grants.sql.
--
-- The point of that migration is that the client's access no longer depends on
-- the project's "Automatically expose new tables" setting, so these assertions
-- pin the privileges themselves rather than only their effect through RLS.
--
-- Run with: npx supabase test db

begin;
select plan(28);

-- ---------------------------------------------------------------------------
-- anon: app_config only
-- ---------------------------------------------------------------------------
select table_privs_are('public', 'app_config', 'anon', array['SELECT'],
  'grants: anon can only SELECT app_config');

select table_privs_are('public', 'expense', 'anon', array[]::text[],
  'grants: anon has no privilege on expense');
select table_privs_are('public', 'income', 'anon', array[]::text[],
  'grants: anon has no privilege on income');
select table_privs_are('public', 'expense_category', 'anon', array[]::text[],
  'grants: anon has no privilege on expense_category');
select table_privs_are('public', 'expense_location', 'anon', array[]::text[],
  'grants: anon has no privilege on expense_location');
select table_privs_are('public', 'income_type', 'anon', array[]::text[],
  'grants: anon has no privilege on income_type');
select table_privs_are('public', 'expense_schedule', 'anon', array[]::text[],
  'grants: anon has no privilege on expense_schedule');
select table_privs_are('public', 'income_schedule', 'anon', array[]::text[],
  'grants: anon has no privilege on income_schedule');
select table_privs_are('public', 'scheduled_expense_queue', 'anon', array[]::text[],
  'grants: anon has no privilege on scheduled_expense_queue');
select table_privs_are('public', 'scheduled_income_queue', 'anon', array[]::text[],
  'grants: anon has no privilege on scheduled_income_queue');

-- ---------------------------------------------------------------------------
-- authenticated: the four verbs on the domain tables, read-only elsewhere
-- ---------------------------------------------------------------------------
select table_privs_are('public', 'expense', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on expense');
select table_privs_are('public', 'income', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on income');
select table_privs_are('public', 'expense_category', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on expense_category');
select table_privs_are('public', 'expense_location', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on expense_location');
select table_privs_are('public', 'income_type', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on income_type');
select table_privs_are('public', 'expense_schedule', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on expense_schedule');
select table_privs_are('public', 'income_schedule', 'authenticated',
  array['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  'grants: authenticated has exactly SELECT/INSERT/UPDATE/DELETE on income_schedule');

-- TRUNCATE is gone too, so the queue lockdown no longer leans on 0003's revoke.
select table_privs_are('public', 'scheduled_expense_queue', 'authenticated',
  array['SELECT'],
  'grants: authenticated can only SELECT scheduled_expense_queue');
select table_privs_are('public', 'scheduled_income_queue', 'authenticated',
  array['SELECT'],
  'grants: authenticated can only SELECT scheduled_income_queue');
select table_privs_are('public', 'app_config', 'authenticated', array['SELECT'],
  'grants: authenticated can only SELECT app_config');

-- ---------------------------------------------------------------------------
-- service_role still owns app_config's writes.
--
-- 0006's `revoke all ... from anon, authenticated` deliberately leaves
-- service_role alone: `scripts/require-app-version.sh` raises
-- min_required_version through PostgREST with the service_role key when a
-- release has to be pulled. Asserted as two capabilities rather than an exact
-- privilege set, so this pins what we depend on without freezing Supabase's
-- other defaults for the role.
-- ---------------------------------------------------------------------------
select ok(has_table_privilege('service_role', 'public.app_config', 'SELECT'),
  'grants: service_role can SELECT app_config');
select ok(has_table_privilege('service_role', 'public.app_config', 'UPDATE'),
  'grants: service_role can UPDATE app_config');

-- ---------------------------------------------------------------------------
-- New tables are not exposed by default any more.
-- ---------------------------------------------------------------------------
create table public.grants_probe (id int primary key);

select table_privs_are('public', 'grants_probe', 'anon', array[]::text[],
  'default privileges: a new table is not exposed to anon');
select table_privs_are('public', 'grants_probe', 'authenticated', array[]::text[],
  'default privileges: a new table is not exposed to authenticated');

-- ---------------------------------------------------------------------------
-- Aggregation RPCs: signed-in callers only.
-- ---------------------------------------------------------------------------
set local role anon;
select set_config('request.jwt.claims', '{"role":"anon"}', true);

select throws_ok(
  $$ select public.transaction_months() $$,
  '42501', null, 'rpc: anon cannot EXECUTE transaction_months()');
select throws_ok(
  $$ select public.column_chart_data() $$,
  '42501', null, 'rpc: anon cannot EXECUTE column_chart_data()');
select throws_ok(
  $$ select public.pie_chart_data(date '2026-01-01', date '2026-02-01') $$,
  '42501', null, 'rpc: anon cannot EXECUTE pie_chart_data()');

reset role;
set local role authenticated;
select set_config('request.jwt.claims',
  '{"sub":"aaaaaaaa-0000-0000-0000-00000000000a","role":"authenticated"}', true);

select lives_ok(
  $$ select public.transaction_months() $$,
  'rpc: authenticated can EXECUTE transaction_months()');

reset role;
select * from finish();
rollback;
