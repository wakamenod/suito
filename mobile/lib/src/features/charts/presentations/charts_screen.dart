import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Material(
              color: Color(0xFFE5F3F9),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color(0xFF63AECE),
                labelColor: Color(0xFF63AECE),
                unselectedLabelColor: Color(0xFFBEE4F4),
                tabs: [
                  Tab(icon: Icon(Icons.stacked_bar_chart)),
                  Tab(icon: Icon(Icons.pie_chart)),
                ],
              ),
            ),
          ),
          title: Text(t.charts.abbBar),
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
