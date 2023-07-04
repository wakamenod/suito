// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transaction_attribute_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
    r'f6f6ecaf4e49e8fb07841dba8184f5f383cb77dc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FilteredCategoriesRef = AutoDisposeFutureProviderRef<
    ({List<AttributeEntry> filteredItems, AttributeEntry selected})>;

/// See also [filteredCategories].
@ProviderFor(filteredCategories)
const filteredCategoriesProvider = FilteredCategoriesFamily();

/// See also [filteredCategories].
class FilteredCategoriesFamily extends Family<
    AsyncValue<
        ({List<AttributeEntry> filteredItems, AttributeEntry selected})>> {
  /// See also [filteredCategories].
  const FilteredCategoriesFamily();

  /// See also [filteredCategories].
  FilteredCategoriesProvider call(
    String selectedValue,
  ) {
    return FilteredCategoriesProvider(
      selectedValue,
    );
  }

  @override
  FilteredCategoriesProvider getProviderOverride(
    covariant FilteredCategoriesProvider provider,
  ) {
    return call(
      provider.selectedValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredCategoriesProvider';
}

/// See also [filteredCategories].
class FilteredCategoriesProvider extends AutoDisposeFutureProvider<
    ({List<AttributeEntry> filteredItems, AttributeEntry selected})> {
  /// See also [filteredCategories].
  FilteredCategoriesProvider(
    this.selectedValue,
  ) : super.internal(
          (ref) => filteredCategories(
            ref,
            selectedValue,
          ),
          from: filteredCategoriesProvider,
          name: r'filteredCategoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredCategoriesHash,
          dependencies: FilteredCategoriesFamily._dependencies,
          allTransitiveDependencies:
              FilteredCategoriesFamily._allTransitiveDependencies,
        );

  final String selectedValue;

  @override
  bool operator ==(Object other) {
    return other is FilteredCategoriesProvider &&
        other.selectedValue == selectedValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, selectedValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$addableInputValueHash() => r'42ca7c701cace6ef9653732ab85f1e26eea92df7';

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
    r'aee37647475c98f872dd7d0203062f9b72211831';

/// See also [TransactionAttributeSubmitController].
@ProviderFor(TransactionAttributeSubmitController)
final transactionAttributeSubmitControllerProvider =
    AutoDisposeNotifierProvider<TransactionAttributeSubmitController,
        AttributeName>.internal(
  TransactionAttributeSubmitController.new,
  name: r'transactionAttributeSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionAttributeSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionAttributeSubmitController
    = AutoDisposeNotifier<AttributeName>;
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
