import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/authentication/services/auth_controller.dart';

/// Signs the user out on open. Once the session clears, the router's redirect
/// guard sends them to the sign-in screen.
class CustomSignOutScreen extends ConsumerStatefulWidget {
  const CustomSignOutScreen({super.key});

  @override
  ConsumerState<CustomSignOutScreen> createState() =>
      _CustomSignOutScreenState();
}

class _CustomSignOutScreenState extends ConsumerState<CustomSignOutScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(signOutControllerProvider.notifier).signOut(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.auth.signOutButton),
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
