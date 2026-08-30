import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito_web/i18n/strings.g.dart';
import 'package:suito_web/src/data/auth_controller.dart';
import 'package:suito_web/src/data/supabase_provider.dart';

/// Self-service account deletion (Google Play's data-deletion policy page).
///
/// Firebase UI needed a re-authentication dialog before deleting; Supabase does
/// not -- the `delete-account` Edge Function verifies the caller's JWT itself
/// and refuses any id but the caller's -- so a confirmation dialog is enough.
class CustomDeleteScreen extends ConsumerWidget {
  const CustomDeleteScreen({super.key});

  Future<bool> _confirm(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.strings.deleteConfirmTitle),
        content: Text(t.strings.deleteConfirmText),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.strings.deleteConfirmCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(t.strings.deleteConfirmOk),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(supabaseAuthProvider).currentUser?.email ?? '';
    final deleteState = ref.watch(deleteAccountControllerProvider);
    final signOutState = ref.watch(signOutControllerProvider);
    final isBusy = deleteState.isLoading || signOutState.isLoading;

    Future<void> onDelete() async {
      if (!await _confirm(context)) return;
      final deleted = await ref
          .read(deleteAccountControllerProvider.notifier)
          .deleteAccount();
      // Signing out inside the controller sends the guard back to /sign-in, so
      // this screen is already gone by the time the snack bar would show.
      if (deleted && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.strings.deleteSucceeded)),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Delete Account')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(t.strings.signedInAs),
                  subtitle: Text(email),
                ),
                const SizedBox(height: 8),
                Text(t.strings.deleteAccountText),
                if (deleteState.hasError) ...[
                  const SizedBox(height: 12),
                  Text(
                    '${deleteState.error}',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: isBusy ? null : onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Theme.of(context).colorScheme.onError,
                  ),
                  child: deleteState.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(t.strings.deleteAccountButton),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: isBusy
                      ? null
                      : () => ref
                          .read(signOutControllerProvider.notifier)
                          .signOut(),
                  child: Text(t.strings.signOutButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
