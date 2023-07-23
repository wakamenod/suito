import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/schedules/presentations/schedule/schedules_list.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.schedules.abbBar),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 7.0),
            child: Text(
              t.schedules.description,
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ),
          const Expanded(child: SchedulesList())
        ],
      ),
    );
  }
}
