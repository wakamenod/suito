import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/features/authentication/presentation/profile/custom_profile_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_in/custom_sign_in_screen.dart';
import 'package:suito/src/features/authentication/presentation/sign_out/custom_sign_out_screen.dart';
import 'package:suito/src/features/charts/presentations/charts_screen.dart';
import 'package:suito/src/features/schedule/presentation/schedule_screen.dart';
import 'package:suito/src/features/transactions/presentations/expense_category_screen.dart';
import 'package:suito/src/features/transactions/presentations/expense_location_screen.dart';
import 'package:suito/src/features/transactions/presentations/expense_memo_screen.dart';
import 'package:suito/src/features/transactions/presentations/income_type_screen.dart';
import 'package:suito/src/features/transactions/presentations/transaction_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';
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
  transactionDetailCategory(path: 'transaction-detail-category'),
  transactionDetailLocation(path: 'transaction-detail-location'),
  transactionDetailIncomeType(path: 'transaction-detail-income-type'),
  transactionDetailMemo(path: 'transaction-detail-memo');

  const AppRoute({required this.path});

  final String path;
}

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
                        path: AppRoute.transactionDetailCategory.path,
                        name: AppRoute.transactionDetailCategory.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseCategoryScreen(),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                      ),
                      GoRoute(
                        path: AppRoute.transactionDetailLocation.path,
                        name: AppRoute.transactionDetailLocation.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseLocationScreen(),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                      ),
                      GoRoute(
                        path: AppRoute.transactionDetailMemo.path,
                        name: AppRoute.transactionDetailMemo.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const ExpenseMemoScreen(),
                          transitionsBuilder: _slideTransitionBuilder,
                        ),
                      ),
                      GoRoute(
                        path: AppRoute.transactionDetailIncomeType.path,
                        name: AppRoute.transactionDetailIncomeType.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                          key: state.pageKey,
                          child: const IncomeTypeScreen(),
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
                  const NoTransitionPage(child: ScheduleScreen())),
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
