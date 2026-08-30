-- Local-only seed. `supabase db reset` runs this after the migrations; it is
-- never applied by `supabase db push`.
--
-- app_config.latest_version defaults to '1.0.0' (0004_functions.sql), which does
-- not match the app's version, so version_check.dart puts a modal
-- forced-update dialog over every screen. Locally that makes the app unusable,
-- and any test that taps something fails with a confusing hit-test error
-- instead of a clear message.
--
-- Keep this in step with `version:` in mobile/pubspec.yaml.
update public.app_config
   set latest_version = '1.0.2', min_required_version = '1.0.2'
 where id = 1;
