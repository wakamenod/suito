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

extension DateTimeRFC3339 on DateTime {
  String toRfc3339() {
    return "${toUtc().toString().split('.')[0].replaceAll(' ', 'T')}Z";
  }
}
