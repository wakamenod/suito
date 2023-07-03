// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'transaction_detail_selection_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredCategoriesHash() =>
    r'34b12e31d3de70b499aac696f8fee95cd1d6fb48';

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
    ({
      List<ModelExpenseCategory> filteredItems,
      ModelExpenseCategory selected
    })>;

/// See also [filteredCategories].
@ProviderFor(filteredCategories)
const filteredCategoriesProvider = FilteredCategoriesFamily();

/// See also [filteredCategories].
class FilteredCategoriesFamily extends Family<
    AsyncValue<
        ({
          List<ModelExpenseCategory> filteredItems,
          ModelExpenseCategory selected
        })>> {
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
    ({
      List<ModelExpenseCategory> filteredItems,
      ModelExpenseCategory selected
    })> {
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

String _$addableInputValueHash() => r'b9ae201c46181c565a0ba6a7837ee4f736fac65d';

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
String _$transactionDetailSelectionControllerHash() =>
    r'07218b496f384781ed3c01e9747dfda0c6a3a097';

/// See also [TransactionDetailSelectionController].
@ProviderFor(TransactionDetailSelectionController)
final transactionDetailSelectionControllerProvider =
    AutoDisposeNotifierProvider<TransactionDetailSelectionController,
        TransactionDetailSelectionState>.internal(
  TransactionDetailSelectionController.new,
  name: r'transactionDetailSelectionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionDetailSelectionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionDetailSelectionController
    = AutoDisposeNotifier<TransactionDetailSelectionState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
