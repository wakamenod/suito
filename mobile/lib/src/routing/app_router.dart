import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_out/custom_sign_out_screen.dart';

enum AppRoute {
  signIn,
  signOut,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/sign-in',
          name: AppRoute.signIn.name,
          builder: (context, state) => const CustomSignInScreen()),
      GoRoute(
          path: '/sign-out',
          name: AppRoute.signOut.name,
          builder: (context, state) => const CustomSignOutScreen()),
    ],
  );
});
