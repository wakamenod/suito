import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// The app-wide [SupabaseClient].
///
/// `Supabase.initialize(...)` must have been awaited before this is read
/// (see `lib/main.dart`).
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// Convenience accessor for the Supabase auth sub client.
final supabaseAuthProvider = Provider<GoTrueClient>((ref) {
  return ref.watch(supabaseClientProvider).auth;
});

/// gotrue's auth event stream: initial session restore, sign in, sign out,
/// token refresh, user update.
///
/// The single point where `onAuthStateChange` is reached for. Both
/// [authStateChangesProvider] and the router's redirect guard derive from this
/// rather than each subscribing on their own.
final authStateStreamProvider = Provider<Stream<AuthState>>((ref) {
  return ref.watch(supabaseAuthProvider).onAuthStateChange;
});

/// [AsyncValue] view of [authStateStreamProvider], for widgets and providers
/// that want to rebuild on every event.
final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(authStateStreamProvider);
});

/// The current [Session], or `null` when signed out. Recomputed on every
/// [authStateChangesProvider] event.
final currentSessionProvider = Provider<Session?>((ref) {
  ref.watch(authStateChangesProvider);
  return ref.watch(supabaseAuthProvider).currentSession;
});
