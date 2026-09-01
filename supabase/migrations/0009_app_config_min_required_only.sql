-- Phase 6 / 0009_app_config_min_required_only.sql
--
-- Narrow the forced-update check down to an emergency brake.
--
-- 0004 shipped app_config with two version columns and version_check.dart
-- compared `latest_version` for exact equality. That was a latch, not a floor:
-- any disagreement in either direction -- including a hosted row left at the
-- '1.0.0' default -- put a dialog the user cannot dismiss over every screen.
-- Keeping the latch aligned meant hand-copying one string into three places
-- (pubspec.yaml, seed.sql, the hosted row) with nothing to catch drift.
--
-- The app now compares semantically against `min_required_version` only:
-- it blocks when the running version is *older*, and is silent otherwise. The
-- '1.0.0' default is below every shipped build, so a project that never touches
-- this row never blocks anyone -- the safe direction to fail in.
--
-- `latest_version` was going to be the "an update is available" tier. We decided
-- against nagging: the stores already advertise updates, and an unused column is
-- exactly what made this fragile the first time round (min_required_version sat
-- here unread for five migrations). Drop it rather than leave it lying about.
alter table public.app_config
  drop column latest_version;

comment on column public.app_config.min_required_version is
  'Emergency brake. Builds older than this are blocked at launch by '
  'version_check.dart (semantic comparison). Leave at the default unless a '
  'release must be pulled -- raise it only once a fixed build is downloadable. '
  'Set it with `just require-app-version`.';
