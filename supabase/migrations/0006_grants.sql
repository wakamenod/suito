-- Phase 5 / 0006_grants.sql
-- Explicit Data API privileges.
--
-- Until now the client's table access came entirely from Supabase's default
-- privileges, which grant every DML verb on new public tables to `anon` and
-- `authenticated`; 0003 and 0004 only revoked what was unwanted. That works,
-- but it ties the project to the dashboard's "Automatically expose new tables"
-- setting: turn it off and every query fails with `permission denied`.
--
-- This migration inverts that. Nothing in `public` is exposed by default, and
-- each table is granted exactly the verbs the app uses. The privileges then
-- live in the migration history rather than in a project setting, so a fresh
-- project reproduces them whether or not auto-exposure is enabled.
--
-- Row scoping is still RLS's job (0003); these grants are the coarse outer
-- layer. Both are needed: a grant without a policy returns nothing, and a
-- policy without a grant is never reached.

-- ---------------------------------------------------------------------------
-- 1. Future tables created by migrations are not exposed.
--
-- Mirrors a hosted project with "Automatically expose new tables" disabled,
-- where this statement is a no-op. Only the `postgres` default ACL is touched:
-- that is the role migrations run as. The `supabase_admin` one covers Supabase's
-- own internal tables and is not ours to change.
-- ---------------------------------------------------------------------------
alter default privileges for role postgres in schema public
  revoke all on tables from anon, authenticated;

-- ---------------------------------------------------------------------------
-- 2. Drop what the default privileges already handed out.
-- ---------------------------------------------------------------------------
revoke all on all tables in schema public from anon, authenticated;

-- ---------------------------------------------------------------------------
-- 3. Grant back exactly what the client needs.
--
-- Domain tables: the four verbs each has an RLS policy for.
-- ---------------------------------------------------------------------------
grant select, insert, update, delete on
  public.expense_category,
  public.expense_location,
  public.income_type,
  public.expense,
  public.income,
  public.expense_schedule,
  public.income_schedule
to authenticated;

-- Queue tables: read-only, and only through the parent-schedule policy. Writes
-- stay with the postgres-owned SECURITY DEFINER functions.
grant select on
  public.scheduled_expense_queue,
  public.scheduled_income_queue
to authenticated;

-- app_config: read by the forced-update check, which runs before sign-in, so
-- `anon` needs it too.
grant select on public.app_config to anon, authenticated;

-- ---------------------------------------------------------------------------
-- 4. Aggregation RPCs: signed-in callers only.
--
-- Postgres grants EXECUTE to PUBLIC by default, and `anon` inherits it from
-- there -- revoking from `anon` alone would change nothing, so PUBLIC is
-- revoked and the roles that need it are granted back. These are SECURITY
-- INVOKER, so RLS would already return no rows to `anon`; this just keeps the
-- unauthenticated surface to what the app actually calls.
-- ---------------------------------------------------------------------------
revoke execute on function public.transaction_months() from public;
grant execute on function public.transaction_months() to authenticated, service_role;

revoke execute on function public.column_chart_data(uuid) from public;
grant execute on function public.column_chart_data(uuid) to authenticated, service_role;

revoke execute on function public.pie_chart_data(date, date, uuid) from public;
grant execute on function public.pie_chart_data(date, date, uuid) to authenticated, service_role;
