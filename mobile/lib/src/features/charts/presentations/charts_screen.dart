import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/charts/presentations/column_chart_view.dart';
import 'package:suito/src/features/charts/presentations/pie_chart_view.dart';

class ChartsScreen extends ConsumerWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 1,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white70), //
            tabs: const [
              Tab(icon: Icon(Icons.stacked_bar_chart)),
              Tab(icon: Icon(Icons.pie_chart)),
            ],
          ),
          title: const Text('Charts'),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ColumnChartView(),
            PieChartView(),
          ],
        ),
      ),
    );
  }
}
