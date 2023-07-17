import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_out/custom_sign_out_screen.dart';
import 'package:suito/src/features/charts/presentations/charts_screen.dart';
import 'package:suito/src/features/schedules/presentations/schedule_detail_screen.dart';
import 'package:suito/src/features/schedules/presentations/schedule_screen.dart';
import 'package:suito/src/features/transaction_attributes/presentations/settings/transaction_attribute_settings_screen.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_select_screen.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_memo_screen.dart';
import 'package:suito/src/features/transactions/presentations/transaction_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/features/transactions/services/transaction//transaction_service.dart';
import 'package:suito/src/routing/go_router_refresh_stream.dart';
import 'package:suito/src/utils/app_lifecycle_state_provider.dart';
import 'package:suito/src/utils/version_check.dart';

import 'shell_screen.dart';

enum AppRoute {
  signIn(path: '/sign-in'),
  signOut(path: '/sign-out'),
  home(path: '/home'),
  profile(path: '/profile'),
  transactionDetail(path: 'transaction-detail'),
  attribute(path: 'attribute'),
  attributeSettings(path: 'attributeSettings'),
  memo(path: 'memo'),
  scheduleDetail(path: 'schedule-detail'),
  scheduleTransactionAttribute(path: 'attribute'),
  scheduleMemo(path: 'memo');

  const AppRoute({required this.path});

  final String path;
}

// TODO move
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final goRouterProvider = Provider.family<GoRouter, GlobalKey<NavigatorState>>(
    (ref, rootNavigatorKey) {
  final versionCheck = ref.watch(versionCheckProvider);

  ref.listen<AppLifecycleState>(appLifecycleStateProvider, (previous, next) {
    versionCheck(rootNavigatorKey.currentContext);
  });

  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.signIn.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      versionCheck(rootNavigatorKey.currentContext);

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
              route: NavigationBarRouteX.fromPath(state.fullPath),
              child: child);
        },
        routes: [
          GoRoute(
              path: NavigationBarRoute.transactions.path,
              name: NavigationBarRoute.transactions.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TransactionsScreen()),
              routes: [
                GoRoute(
                    name: AppRoute.transactionDetail.name,
                    path: AppRoute.transactionDetail.path,
                    pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: TransactionDetailScreen(
                            id: state.queryParameters['id'] ?? '',
                            type: int.tryParse(
                                    state.queryParameters['type'] ?? '') ??
                                TransactionType.expense.value,
                          ),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                    routes: [
                      GoRoute(
                          path: AppRoute.attribute.path,
                          name: AppRoute.attribute.name,
                          pageBuilder: (context, state) => CustomTransitionPage(
                                key: state.pageKey,
                                child: const TransactionAttributeSelectScreen(),
                                transitionsBuilder: _slideTransitionBuilder,
                              ),
                          routes: [
                            GoRoute(
                              path: AppRoute.attributeSettings.path,
                              name: AppRoute.attributeSettings.name,
                              pageBuilder: (context, state) =>
                                  CustomTransitionPage(
                                key: state.pageKey,
                                child:
                                    const TransactionAttributeSettingsScreen(),
                                transitionsBuilder: _slideTransitionBuilder,
                              ),
                            )
                          ]),
                      GoRoute(
                        path: AppRoute.memo.path,
                        name: AppRoute.memo.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseMemoScreen(),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                      ),
                    ]),
              ]),
          GoRoute(
              name: NavigationBarRoute.charts.name,
              path: NavigationBarRoute.charts.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ChartsScreen())),
          GoRoute(
              name: NavigationBarRoute.schedule.name,
              path: NavigationBarRoute.schedule.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ScheduleScreen()),
              routes: [
                GoRoute(
                    name: AppRoute.scheduleDetail.name,
                    path: AppRoute.scheduleDetail.path,
                    pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: ScheduleDetailScreen(
                            id: state.queryParameters['id'] ?? '',
                            type: int.tryParse(
                                    state.queryParameters['type'] ?? '') ??
                                TransactionType.expense.value,
                          ),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                    routes: [
                      GoRoute(
                        path: AppRoute.scheduleTransactionAttribute.path,
                        name: AppRoute.scheduleTransactionAttribute.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const TransactionAttributeSelectScreen(),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                      ),
                      GoRoute(
                        path: AppRoute.scheduleMemo.path,
                        name: AppRoute.scheduleMemo.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseMemoScreen(),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                      ),
                    ]),
              ]),
        ],
      ),
    ],
  );
});

Widget _slideTransitionBuilder(
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) =>
    SlideTransition(
      position: animation.drive(
          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease))),
      child: child,
    );
