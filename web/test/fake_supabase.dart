import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito_web/src/data/supabase_provider.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockFunctionsClient extends Mock implements FunctionsClient {}

/// In-memory stand-in for the Supabase client this app touches: password sign
/// in, sign out, and the `delete-account` Edge Function.
class FakeSupabase {
  FakeSupabase() {
    when(() => client.auth).thenReturn(auth);
    when(() => client.functions).thenReturn(functions);

    when(() => auth.onAuthStateChange).thenAnswer((_) => _events.stream);
    when(() => auth.currentSession).thenAnswer((_) => _session);
    when(() => auth.currentUser).thenAnswer((_) => _session?.user);

    when(() => auth.signInWithPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async {
      if (signInError != null) throw signInError!;
      final session = buildSession();
      _emit(AuthChangeEvent.signedIn, session);
      return AuthResponse(session: session);
    });

    // gotrue drops the local session and notifies before awaiting the network
    // call, so the router guard reacts while the future is still in flight.
    when(() => auth.signOut()).thenAnswer((_) async {
      _emit(AuthChangeEvent.signedOut, null);
      if (signOutError != null) throw signOutError!;
    });

    when(() => functions.invoke(any())).thenAnswer((_) async {
      invokedFunctions.add(_.positionalArguments.first as String);
      if (invokeError != null) throw invokeError!;
      return FunctionResponse(data: {'success': true}, status: 200);
    });
  }

  final MockSupabaseClient client = MockSupabaseClient();
  final MockGoTrueClient auth = MockGoTrueClient();
  final MockFunctionsClient functions = MockFunctionsClient();

  final StreamController<AuthState> _events =
      StreamController<AuthState>.broadcast();
  Session? _session;

  /// Names of the Edge Functions `invoke` was called with, in order.
  final List<String> invokedFunctions = [];

  AuthException? signInError;
  Object? signOutError;
  Object? invokeError;

  List<Override> get overrides => [
        supabaseClientProvider.overrideWithValue(client),
        supabaseAuthProvider.overrideWithValue(auth),
      ];

  /// Puts the fake in a signed-in state before the widget under test is built.
  Session signIn({String email = 'user@test.dev'}) {
    final session = buildSession(email: email);
    _emit(AuthChangeEvent.signedIn, session);
    return session;
  }

  void dispose() => _events.close();

  void _emit(AuthChangeEvent event, Session? session) {
    _session = session;
    if (!_events.isClosed) _events.add(AuthState(event, session));
  }

  static Session buildSession({String email = 'user@test.dev'}) => Session(
        accessToken: 'fake-access-token',
        tokenType: 'bearer',
        user: User(
          id: 'fake-user-id',
          appMetadata: const {},
          userMetadata: const {},
          aud: 'authenticated',
          email: email,
          createdAt: '2026-01-01T00:00:00.000Z',
        ),
      );
}
