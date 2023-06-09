import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_out/custom_sign_out_screen.dart';
import 'package:suito/src/features/schedule/presentation/schedule_screen.dart';
import 'package:suito/src/features/stats/presentation/stats_screen.dart';
import 'package:suito/src/features/transactions/presentations/transaction_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/routing/go_router_refresh_stream.dart';

import 'shell_screen.dart';

enum AppRoute {
  signIn(path: '/sign-in'),
  signOut(path: '/sign-out'),
  home(path: '/home'),
  profile(path: '/profile'),
  transactionDetail(path: 'transaction-detail');

  const AppRoute({required this.path});

  final String path;
}

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final goRouterProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: AppRoute.signIn.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if (isLoggedIn) {
        if (state.location == AppRoute.signIn.path) {
          return NavigationBarRoute.transactions.path;
        }
      } else {
        // TODO fix
        if (state.location == AppRoute.home.path) {
          return AppRoute.signIn.path;
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
          path: AppRoute.signIn.path,
          name: AppRoute.signIn.name,
          builder: (context, state) => const CustomSignInScreen()),
      GoRoute(
          path: AppRoute.signOut.path,
          name: AppRoute.signOut.name,
          builder: (context, state) => const CustomSignOutScreen()),
      GoRoute(
          path: AppRoute.profile.path,
          name: AppRoute.profile.name,
          builder: (context, state) => const CustomProfileScreen()),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ShellScreen(
              route: NavigationBarRouteX.fromPath(state.location),
              child: child);
        },
        routes: [
          GoRoute(
              path: NavigationBarRoute.transactions.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TransactionsScreen()),
              routes: [
                GoRoute(
                  path: AppRoute.transactionDetail.path,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const TransactionDetailScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: animation.drive(
                          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.ease))),
                      child: child,
                    ),
                  ),
                )
              ]),
          GoRoute(
              path: NavigationBarRoute.stats.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: StatsScreen())),
          GoRoute(
              path: NavigationBarRoute.schedule.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ScheduleScreen())),
        ],
      ),
    ],
  );
});
