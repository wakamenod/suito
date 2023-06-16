import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito_web/i18n/strings.g.dart';

import 'ui_auth_providers.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: SignInScreen(
        subtitleBuilder: (context, constraints) {
          return SizedBox(
            width: 100,
            height: 100,
            child: Text(t.strings.signinSubtitle),
          );
        },
        providers: authProviders,
      ),
    );
  }
}
