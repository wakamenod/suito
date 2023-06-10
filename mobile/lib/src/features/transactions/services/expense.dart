import 'package:freezed_annotation/freezed_annotation.dart';

import 'formz/amount.dart';
import 'formz/title.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required Title title,
    required Amount amount,
    required String date,
    required String category,
    required String location,
    required String memo,
    required bool isValid,
  }) = _Expense;

  static Expense empty = const Expense(
      title: Title.pure(),
      amount: Amount.pure(),
      date: '',
      category: '',
      location: '',
      memo: '',
      isValid: true);
}
