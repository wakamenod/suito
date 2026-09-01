// The forced-update check and the profile screen's reachability probe both read
// `app_config`, which replaced the Go backend's /version and /ping endpoints.
// Both run before sign-in, so `anon` has to be able to SELECT the row.
@Tags(['supabase'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/ping/data/ping_repository.dart';
import 'package:suito/src/utils/version_check.dart';

import 'supabase_test_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(initSupabaseForTests);

  test('the required version is readable while signed out', () async {
    await supabaseAuth.signOut();

    final minRequired =
        await VersionRepository(supabase).fetchMinRequiredVersion();

    // app_config is world-readable so the update check can run before sign-in.
    expect(minRequired, isNotEmpty);
  });

  test('the required version is readable while signed in', () async {
    await signUpFreshUser();

    expect(await VersionRepository(supabase).fetchMinRequiredVersion(),
        isNotEmpty);
  });

  test('ping answers once the stack is reachable', () async {
    await supabaseAuth.signOut();

    expect(await PingRepository(supabase).ping(), 'pong');
  });
}
