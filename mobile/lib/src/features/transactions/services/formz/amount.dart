import 'package:formz/formz.dart';

enum AmountValidationError { empty }

class Amount extends FormzInput<int, AmountValidationError> {
  const Amount.pure() : super.pure(0);
  const Amount.dirty([super.value = 0]) : super.dirty();

  @override
  AmountValidationError? validator(int value) {
    if (value <= 0) {
      return AmountValidationError.empty;
    } else {
      return null;
    }
  }

  static String? showAmountErrorMessage(AmountValidationError? error) {
    if (error == AmountValidationError.empty) {
      return 'Empty amount';
    } else {
      return null;
    }
  }
}
