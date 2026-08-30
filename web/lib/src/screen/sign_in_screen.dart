import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito_web/i18n/strings.g.dart';
import 'package:suito_web/src/data/auth_controller.dart';

/// Email/password sign in. Replaces `firebase_ui_auth`'s prebuilt SignInScreen
/// with a plain form calling `supabase.auth.signInWithPassword()`; navigation on
/// success is handled by the router's guard.
class CustomSignInScreen extends ConsumerStatefulWidget {
  const CustomSignInScreen({super.key});

  @override
  ConsumerState<CustomSignInScreen> createState() => _CustomSignInScreenState();
}

class _CustomSignInScreenState extends ConsumerState<CustomSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(signInControllerProvider.notifier)
        .signIn(_email.text.trim(), _password.text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInControllerProvider);
    final isSubmitting = state.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(t.strings.signinSubtitle),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _email,
                    enabled: !isSubmitting,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.email],
                    decoration: InputDecoration(
                      labelText: t.strings.email,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? t.strings.errors.emailRequired
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _password,
                    enabled: !isSubmitting,
                    obscureText: true,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                      labelText: t.strings.password,
                      border: const OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (_) => _submit(),
                    validator: (v) => (v == null || v.isEmpty)
                        ? t.strings.errors.passwordRequired
                        : null,
                  ),
                  if (state.hasError) ...[
                    const SizedBox(height: 12),
                    Text(
                      '${state.error}',
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isSubmitting ? null : _submit,
                    child: isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(t.strings.signInButton),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
