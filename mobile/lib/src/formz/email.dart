import 'package:formz/formz.dart';
import 'package:suito/i18n/translations.g.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final _regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_regex.hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }

  static String? showEmailErrorMessage(Email email) {
    if (email.isPure) return null;
    return switch (email.error) {
      EmailValidationError.empty => t.forms.errors.emptyEmail,
      EmailValidationError.invalid => t.forms.errors.invalidEmail,
      null => null,
    };
  }
}
