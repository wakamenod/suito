import 'package:intl/intl.dart';

final _yyyymmFormatter = DateFormat('yyyy-MM');
final _yyyymmddFormatter = DateFormat('yyyy-MM-dd');

String currentYYYYMM() {
  return _yyyymmFormatter.format(DateTime.now());
}

extension DateExtension on DateTime {
  String toYMD() {
    return _yyyymmddFormatter.format(this);
  }
}
