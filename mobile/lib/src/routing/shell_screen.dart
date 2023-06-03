import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigationBarRoute {
  transactions(
      path: '/transactions', icon: Icons.list_alt, labelName: 'Transactions'),
  stats(path: '/stats', icon: Icons.query_stats, labelName: 'Stats'),
  schedule(path: '/schedule', icon: Icons.schedule, labelName: 'Schedule');

  const NavigationBarRoute(
      {required this.path, required this.icon, required this.labelName});

  final String path;
  final IconData icon;
  final String labelName;
}

extension NavigationBarRouteX on NavigationBarRoute {
  static NavigationBarRoute fromPath(String path) {
    return NavigationBarRoute.values.firstWhere((r) => r.path == path,
        orElse: () => NavigationBarRoute.transactions);
  }
}

class ShellScreen extends StatelessWidget {
  final Widget child;
  final NavigationBarRoute route;

  const ShellScreen({super.key, required this.child, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: [
          for (final r in NavigationBarRoute.values)
            NavigationDestination(
              icon: Icon(r.icon),
              label: r.labelName,
            )
        ],
        onDestinationSelected: (index) => context.go(
          NavigationBarRoute.values[index].path,
        ),
        selectedIndex: route.index,
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
    );
  }
}
