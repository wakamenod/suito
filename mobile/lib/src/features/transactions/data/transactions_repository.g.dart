// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transactions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsRepositoryHash() =>
    r'8cca9e5b0f435f2f7b8f11e13cb0a75f34e56a2e';

/// See also [transactionsRepository].
@ProviderFor(transactionsRepository)
final transactionsRepositoryProvider =
    Provider<TransactionsRepository>.internal(
  transactionsRepository,
  name: r'transactionsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionsRepositoryRef = ProviderRef<TransactionsRepository>;
String _$transactionsListWatchHash() =>
    r'5b6b4844af5d16483506ce684fb247a905a9c7b5';

/// See also [transactionsListWatch].
@ProviderFor(transactionsListWatch)
final transactionsListWatchProvider =
    AutoDisposeStreamProvider<List<Transaction>>.internal(
  transactionsListWatch,
  name: r'transactionsListWatchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionsListWatchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionsListWatchRef
    = AutoDisposeStreamProviderRef<List<Transaction>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
