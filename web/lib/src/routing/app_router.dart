import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito_web/src/data/supabase_provider.dart';
import 'package:suito_web/src/screen/delete_account_screen.dart';
import 'package:suito_web/src/screen/sign_in_screen.dart';

import 'go_router_refresh_stream.dart';

enum AppRoute {
  signIn,
  delete,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(supabaseAuthProvider);
  final authStateChanges = ref.watch(authStateStreamProvider);
  return GoRouter(
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = auth.currentSession != null;
      if (isLoggedIn) {
        if (state.location == '/sign-in') {
          return '/delete';
        }
      } else {
        if (state.location.startsWith('/delete')) {
          return '/sign-in';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authStateChanges),
    routes: [
      GoRoute(
        path: '/sign-in',
        name: AppRoute.signIn.name,
        builder: (context, state) => const CustomSignInScreen(),
      ),
      GoRoute(
        path: '/delete',
        name: AppRoute.delete.name,
        builder: (context, state) => const CustomDeleteScreen(),
      ),
    ],
  );
});
