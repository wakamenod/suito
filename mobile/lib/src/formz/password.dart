import 'package:formz/formz.dart';
import 'package:suito/i18n/translations.g.dart';

enum PasswordValidationError { empty, tooShort }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  /// Matches Supabase Auth's default `minimum_password_length = 6`.
  static const minLength = 6;

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < minLength) {
      return PasswordValidationError.tooShort;
    }
    return null;
  }

  static String? showPasswordErrorMessage(Password password) {
    if (password.isPure) return null;
    return switch (password.error) {
      PasswordValidationError.empty => t.forms.errors.emptyPassword,
      PasswordValidationError.tooShort => t.forms.errors.shortPassword,
      null => null,
    };
  }
}
