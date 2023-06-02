import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/ping/data/ping_repository.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = [EmailAuthProvider()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ProfileScreen(
        providers: authProviders,
        children: [
          _PingWidget(),
        ],
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
