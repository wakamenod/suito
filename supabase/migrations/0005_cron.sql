-- Phase 2 / 0005_cron.sql
-- pg_cron jobs for the recurring-transaction engine. These replace the two
-- in-process gocron jobs from the Go backend.
--
--   enqueue-schedules        '45 * * * *'  -> public.enqueue_transaction_schedules()
--   materialize-transactions  '15 * * * *'  -> public.create_transactions_from_queue()
--
-- pg_cron runs in UTC. The Go jobs ran in JST but on an hourly cadence, so the
-- cron expressions carry over unchanged. cron.schedule() upserts by job name,
-- so this migration is safe to re-run (e.g. `supabase db reset`).
--
-- Jobs execute as the role that scheduled them (postgres, here), which can call
-- the SECURITY DEFINER functions. Schema is qualified explicitly.

select cron.schedule(
  'enqueue-schedules',
  '45 * * * *',
  $$select public.enqueue_transaction_schedules()$$
);

select cron.schedule(
  'materialize-transactions',
  '15 * * * *',
  $$select public.create_transactions_from_queue()$$
);
