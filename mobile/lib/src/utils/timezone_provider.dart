import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timezone_provider.g.dart';

String? _timezone;

@riverpod
Future<String> localTimezone(LocalTimezoneRef ref) async {
  _timezone ??= await FlutterTimezone.getLocalTimezone();
  return _timezone!;
}
