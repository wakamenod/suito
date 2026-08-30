import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// The app-wide [SupabaseClient]. `Supabase.initialize(...)` must have been
/// awaited before this is read (see `lib/main.dart`).
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final supabaseAuthProvider = Provider<GoTrueClient>((ref) {
  return ref.watch(supabaseClientProvider).auth;
});

/// gotrue's auth event stream, reached for in exactly one place so the router
/// guard and any listener share one subscription.
final authStateStreamProvider = Provider<Stream<AuthState>>((ref) {
  return ref.watch(supabaseAuthProvider).onAuthStateChange;
});
