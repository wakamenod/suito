import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

/// One entry of the merged expense + income list.
///
/// Built client-side by `TransactionsRepository` (the Go backend used to do the
/// merge); [type] is a `TransactionType` value -- 1 expense, 2 income -- kept as
/// an int so the existing presentation code is unchanged.
@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String title,
    required int amount,
    required String localDate,
    required int type,
  }) = _Transaction;
}

/// One entry of the schedule list. Income schedules have no title column, so
/// theirs is the income type's name -- resolved when the list is built.
@freezed
class TransactionSchedule with _$TransactionSchedule {
  const factory TransactionSchedule({
    required String id,
    required String title,
    required int amount,
  }) = _TransactionSchedule;
}

/// Both schedule lists, as returned by `SchedulesRepository`.
@freezed
class TransactionSchedules with _$TransactionSchedules {
  const factory TransactionSchedules({
    @Default(<TransactionSchedule>[])
    List<TransactionSchedule> expenseSchedules,
    @Default(<TransactionSchedule>[]) List<TransactionSchedule> incomeSchedules,
  }) = _TransactionSchedules;
}
