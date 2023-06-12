import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final currencyFormatterProvider = Provider<NumberFormat>((ref) {
  // TODO i18n
  return NumberFormat.simpleCurrency(locale: "ja_JP");
});
