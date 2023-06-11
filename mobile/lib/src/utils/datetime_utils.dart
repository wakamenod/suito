import 'package:intl/intl.dart';

final _yyyymmFormatter = DateFormat('yyyy-MM');

String currentYYYYMM() {
  return _yyyymmFormatter.format(DateTime.now());
}
