import 'package:formz/formz.dart';
import 'package:suito/i18n/translations.g.dart';

enum AttributeNameValidationError { empty }

class AttributeName extends FormzInput<String, AttributeNameValidationError> {
  const AttributeName.pure([super.value = '']) : super.pure();
  const AttributeName.dirty([super.value = '']) : super.dirty();

  @override
  AttributeNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return AttributeNameValidationError.empty;
    } else {
      return null;
    }
  }

  static String? showAttributeNameErrorMessage(AttributeName attributeName) {
    if (!attributeName.isPure &&
        attributeName.error == AttributeNameValidationError.empty) {
      return t.forms.errors.emptyAttributeName;
    } else {
      return null;
    }
  }
}
