import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final _yyyymmFormatter = DateFormat('yyyy-MM');
final _yyyymmddFormatter = DateFormat('yyyy-MM-dd');

extension DateExtension on DateTime {
  String toYMD() {
    return _yyyymmddFormatter.format(this);
  }

  String toYYYYMM() {
    return _yyyymmFormatter.format(this);
  }

  String toRfc3339() {
    return "${toString().split('.')[0].replaceAll(' ', 'T')}Z";
  }
}

final currentTimeProvider = Provider<DateTime>((ref) {
  return DateTime.now();
});
