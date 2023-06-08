// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transaction_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsTotalAmountsHash() =>
    r'f44fd72ea9ef7a7f324d46708582726c57a70085';

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
String _$transactionsHash() => r'ccfbc077b43a12b8d2503dcf7c76caee53fef2fb';

/// See also [Transactions].
@ProviderFor(Transactions)
final transactionsProvider =
    AutoDisposeAsyncNotifierProvider<Transactions, List<Transaction>>.internal(
  Transactions.new,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Transactions = AutoDisposeAsyncNotifier<List<Transaction>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
