/// Deep link that Supabase's confirmation and password-reset emails send the
/// user back to.
///
/// Three places have to agree on this value:
///   - `android/app/src/main/AndroidManifest.xml` (`<data android:scheme=...>`)
///   - `ios/Runner/Info.plist` (`CFBundleURLTypes`)
///   - Supabase Auth > URL Configuration > Redirect URLs (and
///     `supabase/config.toml`'s `additional_redirect_urls` for local dev)
///
/// `supabase_flutter` bundles `app_links` and starts a deep-link observer in
/// `Supabase.initialize`, so the incoming link is turned into a session for us.
const kAuthRedirectUrl = 'net.wakamenod.suito://login-callback/';
