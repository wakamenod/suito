// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'schedule_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSchedulesHash() => r'ebee31ec832cf95fb372c3271455423b3b37ce54';

/// See also [fetchSchedules].
@ProviderFor(fetchSchedules)
final fetchSchedulesProvider =
    AutoDisposeFutureProvider<List<Schedules>>.internal(
  fetchSchedules,
  name: r'fetchSchedulesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchSchedulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchSchedulesRef = AutoDisposeFutureProviderRef<List<Schedules>>;
String _$reloadSchedulesHash() => r'506b7787a0faa62b67f0486b5b55c6b0ce3c9521';

/// See also [ReloadSchedules].
@ProviderFor(ReloadSchedules)
final reloadSchedulesProvider =
    AutoDisposeNotifierProvider<ReloadSchedules, int>.internal(
  ReloadSchedules.new,
  name: r'reloadSchedulesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reloadSchedulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReloadSchedules = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
