import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/features/authentication/services/auth_controller.dart';
import 'package:suito/src/features/ping/data/ping_repository.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentSessionProvider);
    final email = session?.user.email ?? '';
    final signOutState = ref.watch(signOutControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.auth.profileTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Scrolls so a long email, a large text scale or the ping
              // widget's error text can't overflow the column.
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(t.auth.signedInAs),
                        subtitle: Text(email),
                      ),
                      const SizedBox(height: 16),
                      _PingWidget(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: signOutState.isLoading
                    ? null
                    : () =>
                        ref.read(signOutControllerProvider.notifier).signOut(),
                child: signOutState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(t.auth.signOutButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PingWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(pingFutureProvider).when(
          data: (data) => Text(data),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        );
  }
}
