import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_out/custom_sign_out_screen.dart';
import 'package:suito/src/routing/go_router_refresh_stream.dart';

enum AppRoute {
  signIn,
  signOut,
  profile,
}

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final goRouterProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if (isLoggedIn) {
        if (state.location == '/sign-in') return '/profile';
      } else {
        if (state.location == '/profile') return '/sign-in';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
          path: '/sign-in',
          name: AppRoute.signIn.name,
          builder: (context, state) => const CustomSignInScreen()),
      GoRoute(
          path: '/sign-out',
          name: AppRoute.signOut.name,
          builder: (context, state) => const CustomSignOutScreen()),
      GoRoute(
          path: '/profile',
          name: AppRoute.profile.name,
          builder: (context, state) => const CustomProfileScreen()),
    ],
  );
});
