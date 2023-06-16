import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito_web/i18n/strings.g.dart';
import 'package:suito_web/src/routing/app_router.dart';

import 'ui_auth_providers.dart';

class CustomDeleteScreen extends ConsumerWidget {
  const CustomDeleteScreen({super.key});

  Future<bool> _reauthenticate(
      BuildContext context, List<AuthProvider> providers, FirebaseAuth auth) {
    return showReauthenticateDialog(
        context: context,
        providers: providers,
        auth: auth,
        onSignedIn: () => Navigator.of(context).pop(true),
        actionButtonLabelOverride: t.strings.reauthenticateButton);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = ref.watch(authProvidersProvider);
    final auth = ref.watch(firebaseAuthProvider);

    return FirebaseUITheme(
      styles: const {},
      child: Scaffold(
        appBar: AppBar(title: const Text('Delete Account')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.strings.deleteAccountText),
              const SizedBox(height: 16),
              DeleteAccountButton(
                auth: auth,
                onSignInRequired: () {
                  return _reauthenticate(context, providers, auth);
                },
              ),
              const SizedBox(height: 16),
              SignOutButton(
                auth: auth,
                variant: ButtonVariant.outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
