-- Phase 1 / 0001_extensions.sql
-- Enable the extensions the migrated backend depends on.
--
--   * pg_cron    -- monthly recurring-transaction jobs (wired up in Phase 2)
--   * pg_uuidv7  -- time-sortable UUID v7 primary keys
--
-- pg_uuidv7 is a C extension that may not ship on every platform. We prefer it
-- when available and otherwise fall back to an equivalent PL/pgSQL function, so
-- that `default public.uuid_generate_v7()` resolves identically everywhere.

-- ---------------------------------------------------------------------------
-- pg_cron: the scheduler lives in the "postgres" database.
-- ---------------------------------------------------------------------------
create extension if not exists pg_cron;

-- ---------------------------------------------------------------------------
-- pg_uuidv7 (best effort). Installed into the "extensions" schema following
-- Supabase convention. A failure here is not fatal -- the PL/pgSQL fallback
-- below covers it.
-- ---------------------------------------------------------------------------
do $$
begin
  if exists (select 1 from pg_available_extensions where name = 'pg_uuidv7') then
    begin
      create extension if not exists pg_uuidv7 with schema extensions;
    exception when others then
      raise notice 'pg_uuidv7 present but not enabled: %', sqlerrm;
    end;
  else
    raise notice 'pg_uuidv7 not available on this platform; using PL/pgSQL uuidv7';
  end if;
end
$$;

-- ---------------------------------------------------------------------------
-- Stable entry point: public.uuid_generate_v7()
--   - thin SQL wrapper over pg_uuidv7's C implementation when present
--   - otherwise a self-contained PL/pgSQL implementation
-- Either way it returns an RFC 9562 version-7 UUID (48-bit unix-ms prefix,
-- random tail), so B-tree PK inserts stay append-mostly and `order by id`
-- remains a valid chronological tie-breaker.
-- ---------------------------------------------------------------------------
do $$
begin
  if exists (
    select 1
    from pg_proc p
    join pg_namespace n on n.oid = p.pronamespace
    where p.proname = 'uuid_generate_v7'
      and n.nspname = 'extensions'
      and p.pronargs = 0
  ) then
    execute $wrap$
      create or replace function public.uuid_generate_v7()
      returns uuid
      language sql
      volatile
      parallel safe
      as $w$ select extensions.uuid_generate_v7() $w$;
    $wrap$;
  else
    execute $impl$
      create or replace function public.uuid_generate_v7()
      returns uuid
      language plpgsql
      volatile
      parallel safe
      as $body$
      declare
        unix_ts_ms bytea;
        uuid_bytes bytea;
      begin
        -- 48-bit big-endian millisecond timestamp
        unix_ts_ms := substring(
          int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint)
          from 3
        );
        -- start from a v4 UUID: gives correct random bits and RFC variant
        uuid_bytes := uuid_send(gen_random_uuid());
        -- overlay the timestamp into the first 6 bytes
        uuid_bytes := overlay(uuid_bytes placing unix_ts_ms from 1 for 6);
        -- force the version nibble (high 4 bits of byte 6) to 0b0111 = 7
        uuid_bytes := set_byte(
          uuid_bytes,
          6,
          (b'0111' || get_byte(uuid_bytes, 6)::bit(4))::bit(8)::int
        );
        return encode(uuid_bytes, 'hex')::uuid;
      end
      $body$;
    $impl$;
  end if;
end
$$;

comment on function public.uuid_generate_v7() is
  'RFC 9562 UUIDv7 generator. Backed by pg_uuidv7 when installed, PL/pgSQL otherwise.';
