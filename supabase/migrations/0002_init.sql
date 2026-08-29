-- Phase 1 / 0002_init.sql
-- The 9 domain tables, ported from ddl/migrations/001_init.up.sql (MySQL) to
-- Supabase Postgres.
--
-- Structural changes vs. the Go/MySQL schema:
--   * identity is owned by auth.users. Every `uid VARCHAR(128)` becomes
--     `user_id uuid not null references auth.users(id) on delete cascade`.
--   * the MySQL `user` table and its generated-column / composite-unique trick
--     are dropped entirely.
--   * string xid PKs become `uuid` v7 (`default public.uuid_generate_v7()`).
--   * real foreign keys replace the app-side "blank out the reference on
--     delete" logic. Category / location / income-type references use
--     `on delete set null`; the queue tables cascade from their parent schedule.
--   * `expense_location_id` / `expense_category_id` / `income_type_id` were
--     `NOT NULL` with an empty-string sentinel; they are now nullable.
--   * timestamps are `timestamptz`; `created_at` / `updated_at` get defaults and
--     `updated_at` is maintained by a trigger (see below).
--   * soft-delete (`deleted_at`) is kept only on the tables the app actually
--     filters on (expense, income, *_schedule) and dropped from the reference
--     tables.
--
-- The unused `expense_split` table (model exists, no repository/service touches
-- it) is intentionally not ported. Add it later if a feature needs it.

-- ---------------------------------------------------------------------------
-- updated_at maintenance
-- ---------------------------------------------------------------------------
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- ===========================================================================
-- Reference tables: expense_category, expense_location, income_type
-- ===========================================================================
create table public.expense_category (
  id         uuid        primary key default public.uuid_generate_v7(),
  user_id    uuid        not null references auth.users (id) on delete cascade,
  name       varchar(256) not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, name)
);

create table public.expense_location (
  id         uuid        primary key default public.uuid_generate_v7(),
  user_id    uuid        not null references auth.users (id) on delete cascade,
  name       varchar(256) not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, name)
);

create table public.income_type (
  id         uuid        primary key default public.uuid_generate_v7(),
  user_id    uuid        not null references auth.users (id) on delete cascade,
  name       varchar(256) not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, name)
);

-- ===========================================================================
-- expense
-- ===========================================================================
create table public.expense (
  id                  uuid        primary key default public.uuid_generate_v7(),
  user_id             uuid        not null references auth.users (id) on delete cascade,
  title               varchar(256) not null,
  amount              integer     not null,
  memo                varchar(512) not null default '',
  expense_location_id uuid        references public.expense_location (id) on delete set null,
  expense_category_id uuid        references public.expense_category (id) on delete set null,
  local_date          date        not null,
  deleted_at          timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);

-- primary access path: WHERE user_id = ? AND local_date >= ? AND local_date < ?
--                      ORDER BY local_date DESC   (charts + transaction list)
create index expense_user_local_date_idx
  on public.expense (user_id, local_date desc)
  where deleted_at is null;
create index expense_category_id_idx on public.expense (expense_category_id);
create index expense_location_id_idx on public.expense (expense_location_id);

-- ===========================================================================
-- income
-- ===========================================================================
create table public.income (
  id             uuid        primary key default public.uuid_generate_v7(),
  user_id        uuid        not null references auth.users (id) on delete cascade,
  income_type_id uuid        references public.income_type (id) on delete set null,
  amount         integer     not null,
  memo           varchar(512) not null default '',
  local_date     date        not null,
  deleted_at     timestamptz,
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now()
);

create index income_user_local_date_idx
  on public.income (user_id, local_date desc)
  where deleted_at is null;
create index income_type_id_idx on public.income (income_type_id);

-- ===========================================================================
-- expense_schedule
-- ===========================================================================
create table public.expense_schedule (
  id                  uuid        primary key default public.uuid_generate_v7(),
  user_id             uuid        not null references auth.users (id) on delete cascade,
  title               varchar(256) not null,
  amount              integer     not null,
  memo                varchar(512) not null default '',
  expense_location_id uuid        references public.expense_location (id) on delete set null,
  expense_category_id uuid        references public.expense_category (id) on delete set null,
  schedule_type       smallint    not null default 0,
  timezone            varchar(64) not null,
  deleted_at          timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);

create index expense_schedule_user_id_idx
  on public.expense_schedule (user_id)
  where deleted_at is null;

-- ===========================================================================
-- income_schedule
-- ===========================================================================
create table public.income_schedule (
  id             uuid        primary key default public.uuid_generate_v7(),
  user_id        uuid        not null references auth.users (id) on delete cascade,
  income_type_id uuid        references public.income_type (id) on delete set null,
  amount         integer     not null,
  memo           varchar(512) not null default '',
  schedule_type  smallint    not null default 0,
  timezone       varchar(64) not null,
  deleted_at     timestamptz,
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now()
);

create index income_schedule_user_id_idx
  on public.income_schedule (user_id)
  where deleted_at is null;

-- ===========================================================================
-- scheduled_expense_queue / scheduled_income_queue
--
-- One pending row per schedule (PK = schedule id). Rows are written only by the
-- Phase 2 SECURITY DEFINER functions / triggers, never by clients -- 0003_rls
-- revokes client DML. Cascade-deletes with the parent schedule.
-- ===========================================================================
create table public.scheduled_expense_queue (
  expense_schedule_id uuid        primary key references public.expense_schedule (id) on delete cascade,
  scheduled_at        timestamptz not null,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);

create index scheduled_expense_queue_due_idx
  on public.scheduled_expense_queue (scheduled_at);

create table public.scheduled_income_queue (
  income_schedule_id uuid        primary key references public.income_schedule (id) on delete cascade,
  scheduled_at       timestamptz not null,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now()
);

create index scheduled_income_queue_due_idx
  on public.scheduled_income_queue (scheduled_at);

-- ---------------------------------------------------------------------------
-- updated_at triggers
-- ---------------------------------------------------------------------------
create trigger set_updated_at before update on public.expense_category
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.expense_location
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.income_type
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.expense
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.income
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.expense_schedule
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.income_schedule
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.scheduled_expense_queue
  for each row execute function public.set_updated_at();
create trigger set_updated_at before update on public.scheduled_income_queue
  for each row execute function public.set_updated_at();
