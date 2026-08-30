import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

import '../../mocks.dart';

/// An in-memory stand-in for [GoTrueClient].
///
/// It reproduces the two ordering details of the real client that the auth
/// controllers have to cope with:
///
///  * `onAuthStateChange` is a replaying broadcast stream, and
///  * `signOut()` drops the local session and notifies subscribers *before* it
///    awaits the network call that revokes the token (see `signOut()` in
///    `gotrue_client.dart`) -- so listeners react while the future is still in
///    flight.
///
/// [networkDelay] models the round trip that localhost is too fast to show.
class FakeAuth {
  FakeAuth({this.networkDelay = Duration.zero}) {
    when(() => client.onAuthStateChange).thenAnswer((_) => _events.stream);
    when(() => client.currentSession).thenAnswer((_) => _session);

    when(() => client.signOut()).thenAnswer((_) async {
      _emit(AuthChangeEvent.signedOut, null);
      await Future<void>.delayed(networkDelay);
      if (signOutError != null) throw signOutError!;
    });

    when(() => client.signInWithPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async {
      await Future<void>.delayed(networkDelay);
      if (signInError != null) throw signInError!;
      final session = buildSession();
      _emit(AuthChangeEvent.signedIn, session);
      return AuthResponse(session: session);
    });

    when(() => client.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
          emailRedirectTo: any(named: 'emailRedirectTo'),
        )).thenAnswer((_) async {
      await Future<void>.delayed(networkDelay);
      if (signUpError != null) throw signUpError!;
      if (signUpNeedsEmailConfirmation) {
        // Supabase returns a user but no session until the email is confirmed.
        return AuthResponse(user: buildSession().user);
      }
      final session = buildSession();
      _emit(AuthChangeEvent.signedIn, session);
      return AuthResponse(session: session);
    });

    when(() => client.resetPasswordForEmail(
          any(),
          redirectTo: any(named: 'redirectTo'),
        )).thenAnswer((_) async {
      await Future<void>.delayed(networkDelay);
      if (resetPasswordError != null) throw resetPasswordError!;
    });
  }

  final Duration networkDelay;
  final MockGoTrueClient client = MockGoTrueClient();
  final BehaviorSubject<AuthState> _events = BehaviorSubject<AuthState>();

  Session? _session;

  /// Errors to raise from the corresponding call, if any.
  AuthException? signInError;
  AuthException? signUpError;
  AuthException? resetPasswordError;
  Object? signOutError;

  /// When true, `signUp` resolves without a session (email confirmation flow).
  bool signUpNeedsEmailConfirmation = false;

  /// Overrides to hand to a `ProviderContainer` / `ProviderScope`. Everything
  /// in `supabase_provider.dart` derives from this one provider.
  List<Override> get overrides =>
      [supabaseAuthProvider.overrideWithValue(client)];

  /// Puts the fake in a signed-in state before the widget under test is built.
  Session signIn() {
    final session = buildSession();
    _emit(AuthChangeEvent.signedIn, session);
    return session;
  }

  void dispose() => _events.close();

  void _emit(AuthChangeEvent event, Session? session) {
    _session = session;
    _events.add(AuthState(event, session));
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
