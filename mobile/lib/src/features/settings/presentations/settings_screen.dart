import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/routing/app_router.dart';

/// The fourth tab. `/profile` and `/sign-out` have had routes since the
/// firebase_auth days but nothing ever navigated to them, so signing out was
/// unreachable from the UI. This is the way in.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(currentSessionProvider)?.user.email ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(t.settings.appBar)),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(t.settings.account),
              subtitle: email.isEmpty ? null : Text(email),
              trailing: const Icon(Icons.chevron_right),
              // Pushed, not `go`: /profile sits outside the shell, so this
              // covers the nav bar and gets a back button. The sign-out button
              // already lives on that screen.
              onTap: () => context.pushNamed(AppRoute.profile.name),
            ),
          ],
        ),
      ),
    );
  }
}
