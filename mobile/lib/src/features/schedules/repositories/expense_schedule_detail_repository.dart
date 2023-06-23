import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_expense_schedule_detail_repository.dart';

part 'expense_schedule_detail_repository.g.dart';

class ExpenseScheduleDetailRepository {
  ExpenseScheduleDetailRepository(this._openapi);
  // ignore: unused_field, TODO
  final Openapi _openapi;

  Future<FakeExpenseScheduleDetailRes> fetchExpenseScheduleDetail(
      String id) async {
    // final api = _openapi.getSuitoExpenseScheduleApi();
    // final response =
    //     await api.expenseScheduleDetail(request: ExpenseScheduleDetailReq((r) => r.id = id));
    // return response.data ?? ExpenseScheduleDetailRes();
    return Future.value(FakeExpenseScheduleDetailRes('', '', 0, '', '', ''));
  }
}

@Riverpod(keepAlive: true)
ExpenseScheduleDetailRepository expenseScheduleDetailRepository(
    ExpenseScheduleDetailRepositoryRef ref) {
  throw UnimplementedError();
}
