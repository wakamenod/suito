import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/transaction_months_repository.dart';
import 'package:suito/src/utils/datetime_utils.dart';

part 'transaction_year_months.g.dart';

@riverpod
class TransactionYearMonths extends _$TransactionYearMonths {
  @override
  FutureOr<List<String>> build() {
    return _fetchTransactionYearMonths();
  }

  Future<List<String>> _fetchTransactionYearMonths() async {
    final repository = ref.read(transactionMonthsRepositoryProvider);
    final res = await repository.fetchTransactionMonthsList();
    // 現在月は常に入れるようにする
    final current = currentYYYYMM();
    res.contains(current) ? null : res.add(current);
    return res;
  }
}

// トランザクション一覧の年月ドロップダウンで選択中の年月を管理する
final selectedYearMonthProvider = StateProvider<String>(
  (ref) => currentYYYYMM(),
);
