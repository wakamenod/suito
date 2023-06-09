import 'package:formz/formz.dart';
import 'package:suito/i18n/translations.g.dart';

enum TitleValidationError { empty }

class Title extends FormzInput<String, TitleValidationError> {
  const Title.pure() : super.pure('');
  const Title.dirty([super.value = '']) : super.dirty();

  @override
  TitleValidationError? validator(String value) {
    if (value.isEmpty) {
      return TitleValidationError.empty;
    } else {
      return null;
    }
  }

  static String? showTitleErrorMessage(Title title) {
    if (!title.isPure && title.error == TitleValidationError.empty) {
      return t.forms.errors.emptyTitle;
    } else {
      return null;
    }
  }
}
