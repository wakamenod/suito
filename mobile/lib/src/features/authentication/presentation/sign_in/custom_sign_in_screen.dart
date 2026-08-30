import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'package:suito/src/common_widgets/input_with_error_text.dart';
import 'package:suito/src/features/authentication/presentation/password_reset/password_reset_dialog.dart';
import 'package:suito/src/features/authentication/services/auth_controller.dart';
import 'package:suito/src/formz/email.dart';
import 'package:suito/src/formz/password.dart';

/// Email/password sign-in and sign-up. The UI is a thin `formz` form built from
/// the shared `common_widgets`; auth calls go straight to `supabase.auth`.
/// Navigation on success is handled by the router's redirect guard, which
/// listens to `onAuthStateChange`.
class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignUp = ref.watch(
      authFormControllerProvider.select((f) => f.isSignUp),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isSignUp ? t.auth.signUpTitle : t.auth.signInTitle),
      ),
      // The form lives in its own widget so `baseInputDecoration` receives a
      // context below Scaffold/Material -- otherwise its RichText label picks up
      // the framework's fallback DefaultTextStyle instead of the theme's.
      body: const SafeArea(child: _SignInForm()),
    );
  }
}

class _SignInForm extends ConsumerWidget {
  const _SignInForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(authFormControllerProvider);
    final formController = ref.read(authFormControllerProvider.notifier);
    final submitState = ref.watch(authSubmitControllerProvider);
    final isSubmitting = submitState.isLoading;

    Future<void> onSubmit() async {
      formController.touch();
      final result = await ref
          .read(authSubmitControllerProvider.notifier)
          .submit(ref.read(authFormControllerProvider));

      if (result != AuthSubmitResult.failed) {
        // Closes the AutofillGroup below, which is what actually raises the
        // "save this password?" prompt. Wrapping the fields is not enough.
        TextInput.finishAutofillContext();
      }
      if (result == AuthSubmitResult.needsEmailConfirmation &&
          context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.auth.signUpConfirmation)),
        );
      }
    }

    Future<void> onForgotPassword() async {
      final sent = await PasswordResetDialog.show(
        context,
        initialEmail: ref.read(authFormControllerProvider).email.value,
      );
      if (sent && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.auth.passwordResetSent)),
        );
      }
    }

    final submitErrorText =
        submitState.hasError ? '${submitState.error}' : null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // `autofillHints` alone does nothing on iOS: the password manager
          // only offers to save credentials for fields inside an
          // AutofillGroup, committed by `TextInput.finishAutofillContext()`.
          AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputWithErorrText(
                  errorText: Email.showEmailErrorMessage(form.email),
                  inputField: TextFormField(
                    initialValue: form.email.value,
                    enabled: !isSubmitting,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.email],
                    onChanged: formController.onChangeEmail,
                    decoration: baseInputDecoration(
                      labelText: t.auth.email,
                      context: context,
                      isRequired: true,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                InputWithErorrText(
                  errorText: Password.showPasswordErrorMessage(form.password),
                  inputField: TextFormField(
                    initialValue: form.password.value,
                    enabled: !isSubmitting,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.password],
                    onChanged: formController.onChangePassword,
                    onFieldSubmitted: (_) => onSubmit(),
                    decoration: baseInputDecoration(
                      labelText: t.auth.password,
                      context: context,
                      isRequired: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (submitErrorText != null) ...[
            const SizedBox(height: 12),
            Text(
              submitErrorText,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: isSubmitting ? null : onSubmit,
            child: isSubmitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    form.isSignUp ? t.auth.signUpButton : t.auth.signInButton),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: isSubmitting ? null : formController.toggleMode,
            child: Text(
              form.isSignUp ? t.auth.toSignInPrompt : t.auth.toSignUpPrompt,
            ),
          ),
          // Sign-up has no password to recover yet.
          if (!form.isSignUp)
            TextButton(
              onPressed: isSubmitting ? null : onForgotPassword,
              child: Text(t.auth.forgotPassword),
            ),
        ],
      ),
    );
  }
}
