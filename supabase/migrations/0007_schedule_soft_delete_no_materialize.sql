-- 0007_schedule_soft_delete_no_materialize.sql
--
-- A soft-deleted schedule used to materialize exactly one more transaction.
--
-- The sequence: the user creates a schedule, the AFTER INSERT trigger enqueues
-- next month's row, the user deletes the schedule (which only stamps
-- `deleted_at` -- the queue row is untouched), and next month's cron run finds
-- that queue row still due and turns it into a real expense/income.
--
-- It happens only once. `enqueue_transaction_schedules()` filters
-- `s.deleted_at is null`, so nothing is ever enqueued again. The Go
-- implementation had the same hole (`CreateExpensesFromScheduledQueue` ran raw
-- SQL that bypassed gorm's soft delete), so this is not a migration
-- regression -- but Phase 4 made schedule deletion reachable from the UI.
--
-- The fix filters on the INSERT rather than the DELETE. Putting
-- `s.deleted_at is null` in the DELETE ... USING predicate would leave the
-- queue row behind forever; keeping the DELETE as-is and dropping the row on
-- the way into the target table clears the queue exactly as before while
-- creating nothing. `s.deleted_at` therefore rides along in RETURNING purely
-- as a filter column.
--
-- Everything else -- SECURITY DEFINER, the pinned search_path, the timezone
-- arithmetic -- is carried over unchanged from 0004_functions.sql.

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
      s.deleted_at,
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
  from due
  where deleted_at is null;

  with due as (
    delete from public.scheduled_income_queue q
    using public.income_schedule s
    where s.id = q.income_schedule_id
      and q.scheduled_at < now()
    returning
      s.deleted_at,
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
  from due
  where deleted_at is null;
end;
$$;

-- `create or replace` keeps the existing ACL, so this is a no-op today. Re-stated
-- to match 0004 and to keep the grant visible next to the definition.
revoke execute on function public.create_transactions_from_queue() from public, anon, authenticated;
