import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseUserId on SupabaseClient {
  /// The signed-in user's id, for the `user_id` column every RLS policy checks.
  ///
  /// Repositories only run behind the router's auth guard, so no session here
  /// is a programming error rather than a state the UI has to render.
  String get requireUserId {
    final id = auth.currentUser?.id;
    if (id == null) {
      throw StateError(
          'No Supabase session: a repository ran while signed out');
    }
    return id;
  }
}
