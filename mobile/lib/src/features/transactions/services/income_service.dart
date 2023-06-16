import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/income_detail_repository.dart';

import 'income.dart';
import 'formz/amount.dart';
import 'formz/title.dart' as formz_title;

part 'income_service.g.dart';

// FIXME; there should be a better way than using unnecessary AsyncValues...
@riverpod
class IncomeController extends _$IncomeController {
  @override
  FutureOr<Income> build(String arg) async {
    if (arg.isEmpty) {
      return Income.init();
    }
    final modelRes =
        await ref.read(incomeDetailRepositoryProvider).fetchIncomeDetail(arg);
    return Income.fromModel(modelRes);
  }

  // bool get _isNew => state.value!.id == '';

  void onChangeTitle(String value) {
    final title = formz_title.Title.dirty(value);

    state = AsyncValue.data(state.value!.copyWith(
      title: title,
      isValid: Formz.validate([
        title,
        state.value!.amount,
      ]),
    ));
  }

  void onChangeAmount(int value) {
    final amount = Amount.dirty(value);

    state = AsyncValue.data(state.value!.copyWith(
      amount: amount,
      isValid: Formz.validate([
        amount,
        state.value!.title,
      ]),
    ));
  }

  void onChangeDate(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      date: value,
    ));
  }

  void onChangeMemo(String value) {
    state = AsyncValue.data(state.value!.copyWith(
      memo: value,
    ));
  }

  // RegisterIncomeReq _registerRequest() {
  //   return RegisterIncomeReq((r) => r
  //     ..income.replace(ModelIncome((e) => e
  //       ..id = ''
  //       ..title = state.value!.title.value
  //       ..localDate = DateTime.parse(state.value!.date).toRfc3339()
  //       ..memo = state.value!.memo
  //       ..amount = state.value!.amount.value)));
  // }

  // UpdateIncomeReq _updateRequest() {
  //   return UpdateIncomeReq((r) => r
  //     ..category = state.value!.category
  //     ..income.replace(ModelIncome((e) => e
  //       ..id = state.value!.id
  //       ..title = state.value!.title.value
  //       ..localDate = DateTime.parse(state.value!.date).toRfc3339()
  //       ..memo = state.value!.memo
  //       ..amount = state.value!.amount.value))
  //     ..location = state.value!.location);
  // }

  void registerIncome() async {
    if (!state.value!.isValid) return;
    // state = const AsyncValue.loading();

    // // TODO エラーハンドリング
    // // TODO submissionStatusをUI側で監視し送信中を表す
    // // try {
    // // await _authenticationRepository.signUpWithEmailAndPassword(
    // //   email: state.email.value,
    // //   password: state.password.value,
    // // );

    // _isNew
    //     ? await ref
    //         .read(registerIncomeRepositoryProvider)
    //         .registerIncome(_registerRequest())
    //     : await ref
    //         .read(updateIncomeRepositoryProvider)
    //         .updateIncome(_updateRequest());

    // ref.read(reloadTransactionsProvider.notifier).reload();

    // state = AsyncValue.data(
    //     state.value!.copyWith(submissionStatus: FormzSubmissionStatus.success));
    // } on CustomFailure catch (e) {
    //   state = state.copyWith(
    //       status: FormzSubmissionStatus.failure, errorMessage: e.code);
    // }
  }
}

extension DateTimeRFC3339 on DateTime {
  String toRfc3339() {
    return "${toUtc().toString().split('.')[0].replaceAll(' ', 'T')}Z";
  }
}
