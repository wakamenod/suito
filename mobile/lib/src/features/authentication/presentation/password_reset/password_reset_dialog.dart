import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'package:suito/src/common_widgets/input_with_error_text.dart';
import 'package:suito/src/features/authentication/services/auth_controller.dart';
import 'package:suito/src/formz/email.dart';

/// Asks for an address and sends the "set a new password" email.
///
/// firebase_ui_auth shipped this flow for free; without it a user who forgets
/// their password is locked out for good.
///
/// Pops `true` once Supabase has accepted the request.
class PasswordResetDialog extends ConsumerStatefulWidget {
  const PasswordResetDialog({super.key, this.initialEmail = ''});

  /// Seeded with whatever the user already typed on the sign-in form.
  final String initialEmail;

  static Future<bool> show(BuildContext context, {String initialEmail = ''}) =>
      showDialog<bool>(
        context: context,
        builder: (_) => PasswordResetDialog(initialEmail: initialEmail),
      ).then((sent) => sent ?? false);

  @override
  ConsumerState<PasswordResetDialog> createState() =>
      _PasswordResetDialogState();
}

class _PasswordResetDialogState extends ConsumerState<PasswordResetDialog> {
  late Email _email = widget.initialEmail.isEmpty
      ? const Email.pure()
      : Email.dirty(widget.initialEmail);

  Future<void> _send() async {
    // Mark dirty so an empty/invalid address shows its message on the first tap.
    setState(() => _email = Email.dirty(_email.value));

    final sent = await ref
        .read(passwordResetControllerProvider.notifier)
        .sendResetEmail(_email);

    if (sent && mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(passwordResetControllerProvider);
    final isSending = state.isLoading;

    return AlertDialog(
      title: Text(t.auth.passwordResetTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(t.auth.passwordResetDescription),
          const SizedBox(height: 16),
          InputWithErorrText(
            errorText: Email.showEmailErrorMessage(_email),
            inputField: TextFormField(
              initialValue: widget.initialEmail,
              enabled: !isSending,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autofillHints: const [AutofillHints.email],
              onChanged: (value) => setState(() => _email = Email.dirty(value)),
              onFieldSubmitted: (_) => _send(),
              decoration: baseInputDecoration(
                labelText: t.auth.email,
                context: context,
                isRequired: true,
              ),
            ),
          ),
          if (state.hasError) ...[
            const SizedBox(height: 12),
            Text(
              '${state.error}',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: isSending ? null : () => Navigator.of(context).pop(false),
          child: Text(t.auth.cancel),
        ),
        ElevatedButton(
          onPressed: isSending ? null : _send,
          child: isSending
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(t.auth.passwordResetSendButton),
        ),
      ],
    );
  }
}
