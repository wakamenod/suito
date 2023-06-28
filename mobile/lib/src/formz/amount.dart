import 'package:formz/formz.dart';
import 'package:suito/i18n/translations.g.dart';

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

  static String? showAmountErrorMessage(Amount amount) {
    if (!amount.isPure && amount.error == AmountValidationError.empty) {
      return t.forms.errors.emptyAmount;
    } else {
      return null;
    }
  }
}
