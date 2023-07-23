import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_out/custom_sign_out_screen.dart';
import 'package:suito/src/features/charts/presentations/charts_screen.dart';
import 'package:suito/src/features/schedules/presentations/expense/expense_schedule_detail_screen.dart';
import 'package:suito/src/features/schedules/presentations/income/income_schedule_detail_screen.dart';
import 'package:suito/src/features/schedules/presentations/schedule_screen.dart';
import 'package:suito/src/features/transaction_attributes/presentations/settings/transaction_attribute_settings_screen.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_select_screen.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_memo_screen.dart';
import 'package:suito/src/features/transactions/presentations/incomes/income_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/routing/go_router_refresh_stream.dart';
import 'package:suito/src/utils/app_lifecycle_state_provider.dart';
import 'package:suito/src/utils/version_check.dart';

import 'shell_screen.dart';

enum AppRoute {
  signIn(path: '/sign-in'),
  signOut(path: '/sign-out'),
  home(path: '/home'),
  profile(path: '/profile'),
  expenseDetail(path: 'expense'),
  incomeDetail(path: 'income'),
  attribute(path: 'attribute'),
  attributeSettings(path: 'attributeSettings'),
  scheduleExpenseDetail(path: 'expense'),
  scheduleIncomeDetail(path: 'income'),
  memo(path: 'memo'),
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
                    name: AppRoute.expenseDetail.name,
                    path: AppRoute.expenseDetail.path,
                    pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseDetailScreen(),
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
                GoRoute(
                  name: AppRoute.incomeDetail.name,
                  path: AppRoute.incomeDetail.path,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const IncomeDetailScreen(),
                    transitionsBuilder: _slideTransitionBuilder,
                  ),
                ),
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
                    name: AppRoute.scheduleExpenseDetail.name,
                    path: AppRoute.scheduleExpenseDetail.path,
                    pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseScheduleDetailScreen(),
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
                GoRoute(
                  name: AppRoute.scheduleIncomeDetail.name,
                  path: AppRoute.scheduleIncomeDetail.path,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const IncomeScheduleDetailScreen(),
                    transitionsBuilder: _slideTransitionBuilder,
                  ),
                ),
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
