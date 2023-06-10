import 'package:formz/formz.dart';

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

  static String? showTitleErrorMessage(TitleValidationError? error) {
    if (error == TitleValidationError.empty) {
      return 'Empty title';
    } else {
      return null;
    }
  }
}
