// The forced-update check and the profile screen's reachability probe both read
// `app_config`, which replaced the Go backend's /version and /ping endpoints.
@Tags(['supabase'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/ping/data/ping_repository.dart';
import 'package:suito/src/utils/version_check.dart';

import 'supabase_test_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(initSupabaseForTests);

  test('the version is readable while signed out', () async {
    await supabaseAuth.signOut();

    final version = await VersionRepository(supabase).fetchVersion();

    // app_config is world-readable so the update check can run before sign-in.
    expect(version, isNotEmpty);
  });

  test('the version is readable while signed in', () async {
    await signUpFreshUser();

    expect(await VersionRepository(supabase).fetchVersion(), isNotEmpty);
  });

  test('ping answers once the stack is reachable', () async {
    await supabaseAuth.signOut();

    expect(await PingRepository(supabase).ping(), 'pong');
  });
}
