// Shared setup for the `supabase`-tagged tests: they run against a LOCAL
// Supabase stack rather than a mock.
//
//   (cd .. && npx supabase start)
//   fvm flutter test --tags supabase

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Well-known local Supabase dev credentials -- identical on every machine, and
/// not a secret.
const localSupabaseUrl = 'http://127.0.0.1:54321';
const localSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0';

const testPassword = 'password123';

SupabaseClient get supabase => Supabase.instance.client;
GoTrueClient get supabaseAuth => supabase.auth;

int _seq = 0;
String uniqueEmail([String prefix = 'repo']) =>
    '${prefix}_${DateTime.now().microsecondsSinceEpoch}_${_seq++}@test.dev';

/// A name no other test run has used, for the `unique (user_id, name)`
/// reference tables.
String uniqueName(String prefix) =>
    '$prefix ${DateTime.now().microsecondsSinceEpoch}_${_seq++}';

/// Boots the client once per test file.
Future<void> initSupabaseForTests() async {
  // flutter_test installs an HttpOverrides that stubs every request with an
  // empty 400. Drop it so these tests reach the local stack.
  HttpOverrides.global = null;
  // supabase_flutter persists the session through shared_preferences, which has
  // no plugin implementation in the VM test host.
  SharedPreferences.setMockInitialValues({});
  await Supabase.initialize(
    url: localSupabaseUrl,
    anonKey: localSupabaseAnonKey,
    debug: false,
  );
}

/// Signs up a brand new user and leaves it signed in, so each test gets its own
/// RLS scope and starts from an empty data set. Returns the user's id.
Future<String> signUpFreshUser() async {
  await supabaseAuth.signOut();
  final res = await supabaseAuth.signUp(
    email: uniqueEmail(),
    password: testPassword,
  );
  final user = res.user;
  expect(user, isNotNull,
      reason: 'local sign-up must return a session; '
          'is "confirm email" disabled in supabase/config.toml?');
  return user!.id;
}
