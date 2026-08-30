import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'ping_repository.g.dart';

/// Reachability check shown on the profile screen. It used to hit the Go
/// backend's `/ping`; the Supabase equivalent is the cheapest read there is --
/// one row of the world-readable `app_config` table.
class PingRepository {
  PingRepository(this._client);
  final SupabaseClient _client;

  Future<String> ping() async {
    await _client.from('app_config').select('id').eq('id', 1).single();
    return 'pong';
  }
}

@Riverpod(keepAlive: true)
PingRepository pingRepository(PingRepositoryRef ref) {
  return PingRepository(ref.watch(supabaseClientProvider));
}

@riverpod
Future<String> pingFuture(PingFutureRef ref) {
  final pingRepository = ref.watch(pingRepositoryProvider);
  return pingRepository.ping();
}
