// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transaction_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsTotalAmountsHash() =>
    r'aeb182034923aaae31d212076d1b1d62f9b8af0c';

/// See also [transactionsTotalAmounts].
@ProviderFor(transactionsTotalAmounts)
final transactionsTotalAmountsProvider =
    AutoDisposeProvider<TransactionsTotalAmounts>.internal(
  transactionsTotalAmounts,
  name: r'transactionsTotalAmountsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionsTotalAmountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionsTotalAmountsRef
    = AutoDisposeProviderRef<TransactionsTotalAmounts>;
String _$fetchTransactionsHash() => r'e01a8c6ef3b9b38e3825ccf43199f2209bc1740e';

/// See also [fetchTransactions].
@ProviderFor(fetchTransactions)
final fetchTransactionsProvider =
    AutoDisposeFutureProvider<List<Transaction>>.internal(
  fetchTransactions,
  name: r'fetchTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchTransactionsRef = AutoDisposeFutureProviderRef<List<Transaction>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
