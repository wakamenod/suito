-- 0008_income_type_in_use_guard.sql
--
-- Block deletion of an income type that a live income or income schedule still
-- points at.
--
-- Unlike an expense, an income has no `title` column of its own -- the UI
-- borrows the income type's name for it. `income.income_type_id` is
-- `on delete set null`, so deleting a type in use blanks the title of every
-- income that referenced it (`mergeTransactions`, `buildTransactionSchedules`
-- and `IncomeFormValue.fromIncome` all render `?.name ?? ''`), and the chart
-- RPCs collapse them into one nameless `coalesce(it.name, '')` series.
--
-- The confirmation dialog has always claimed this is already prevented
-- ("収入データで使用中の収入種別は削除できません" / "Income types that are in use
-- within income data cannot be deleted."), so this makes the promise true.
--
-- Why a trigger and not `on delete restrict`:
--   Incomes are soft-deleted. A FK constraint counts soft-deleted rows, so a
--   type whose only referents are invisible to the user would be undeletable
--   with no explanation the UI could give. Only a trigger can honour
--   `deleted_at is null`.
--
-- Why not the same treatment for expense_category / expense_location:
--   An expense carries its own title, so nothing goes blank, and their dialog
--   text already describes the `set null` behaviour accurately.
--
-- SECURITY INVOKER on purpose: the lookups run under the caller's RLS. An
-- income type is unique per user and can only ever be referenced by that same
-- user's rows, so the caller can always see every referent that matters --
-- while a DEFINER function would read across tenants for no benefit.

create or replace function public.trg_block_income_type_in_use()
returns trigger
language plpgsql
security invoker
set search_path = public, pg_temp
as $$
begin
  if exists (
    select 1 from public.income
    where income_type_id = old.id and deleted_at is null
  ) or exists (
    select 1 from public.income_schedule
    where income_type_id = old.id and deleted_at is null
  ) then
    raise exception 'income type % is still in use', old.id
      using errcode = '23503';
  end if;
  return old;
end;
$$;

revoke execute on function public.trg_block_income_type_in_use() from public, anon, authenticated;

create trigger block_delete_when_in_use
  before delete on public.income_type
  for each row execute function public.trg_block_income_type_in_use();
