// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transaction_attribute_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listAttributeEntriesHash() =>
    r'989e4d9f4f411c57cbd141f0f960d610aef3c25c';

/// See also [listAttributeEntries].
@ProviderFor(listAttributeEntries)
final listAttributeEntriesProvider =
    AutoDisposeFutureProvider<List<AttributeEntry>>.internal(
  listAttributeEntries,
  name: r'listAttributeEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listAttributeEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListAttributeEntriesRef
    = AutoDisposeFutureProviderRef<List<AttributeEntry>>;
String _$attributeIDHash() => r'99bf1b367fbed6d6d3d6b7795e6e08073857c2b9';

/// See also [attributeID].
@ProviderFor(attributeID)
final attributeIDProvider = AutoDisposeProvider<String>.internal(
  attributeID,
  name: r'attributeIDProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$attributeIDHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttributeIDRef = AutoDisposeProviderRef<String>;
String _$transactionAttributeRepositoryHash() =>
    r'6b13c6d6b6be2e5b8234bb9826421771d1c46eba';

/// See also [transactionAttributeRepository].
@ProviderFor(transactionAttributeRepository)
final transactionAttributeRepositoryProvider =
    AutoDisposeProvider<TransactionAttributeRepository>.internal(
  transactionAttributeRepository,
  name: r'transactionAttributeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionAttributeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionAttributeRepositoryRef
    = AutoDisposeProviderRef<TransactionAttributeRepository>;
String _$transactionAttributeWordsHash() =>
    r'93123c0ea567ddc7af0e02297fb7f6b702bf2269';

/// See also [transactionAttributeWords].
@ProviderFor(transactionAttributeWords)
final transactionAttributeWordsProvider =
    AutoDisposeProvider<TransactionAttributeWords>.internal(
  transactionAttributeWords,
  name: r'transactionAttributeWordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionAttributeWordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionAttributeWordsRef
    = AutoDisposeProviderRef<TransactionAttributeWords>;
String _$filteredCategoriesHash() =>
    r'594fc4eb01b8749a0feb7f84b1e55b084c55da2c';

/// See also [filteredCategories].
@ProviderFor(filteredCategories)
final filteredCategoriesProvider = AutoDisposeFutureProvider<
    ({List<AttributeEntry> filteredItems, AttributeEntry selected})>.internal(
  filteredCategories,
  name: r'filteredCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredCategoriesRef = AutoDisposeFutureProviderRef<
    ({List<AttributeEntry> filteredItems, AttributeEntry selected})>;
String _$addableInputValueHash() => r'31d415c837cd44c5912bc679f7f1c63b34cb6128';

/// See also [addableInputValue].
@ProviderFor(addableInputValue)
final addableInputValueProvider = AutoDisposeFutureProvider<String?>.internal(
  addableInputValue,
  name: r'addableInputValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addableInputValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddableInputValueRef = AutoDisposeFutureProviderRef<String?>;
String _$transactionAttributeSubmitControllerHash() =>
    r'19726837ceb42c0a8862e76a6fa19f7c2c4448db';

/// See also [TransactionAttributeSubmitController].
@ProviderFor(TransactionAttributeSubmitController)
final transactionAttributeSubmitControllerProvider = NotifierProvider<
    TransactionAttributeSubmitController, AttributeName>.internal(
  TransactionAttributeSubmitController.new,
  name: r'transactionAttributeSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionAttributeSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionAttributeSubmitController = Notifier<AttributeName>;
String _$transactionAttributeSearchControllerHash() =>
    r'69e34ce7f42755d5fb9a81bc6b5c84e1cbd0dfc1';

/// See also [TransactionAttributeSearchController].
@ProviderFor(TransactionAttributeSearchController)
final transactionAttributeSearchControllerProvider =
    AutoDisposeNotifierProvider<TransactionAttributeSearchController,
        TransactionAttributeSearchState>.internal(
  TransactionAttributeSearchController.new,
  name: r'transactionAttributeSearchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionAttributeSearchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionAttributeSearchController
    = AutoDisposeNotifier<TransactionAttributeSearchState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
