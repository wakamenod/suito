// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'expense_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseFutureHash() => r'0e9847409e0ba7d52123cad6b6dccd90391f95ef';

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

typedef ExpenseFutureRef = AutoDisposeFutureProviderRef<Expense>;

/// See also [expenseFuture].
@ProviderFor(expenseFuture)
const expenseFutureProvider = ExpenseFutureFamily();

/// See also [expenseFuture].
class ExpenseFutureFamily extends Family<AsyncValue<Expense>> {
  /// See also [expenseFuture].
  const ExpenseFutureFamily();

  /// See also [expenseFuture].
  ExpenseFutureProvider call({
    String? id,
  }) {
    return ExpenseFutureProvider(
      id: id,
    );
  }

  @override
  ExpenseFutureProvider getProviderOverride(
    covariant ExpenseFutureProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'expenseFutureProvider';
}

/// See also [expenseFuture].
class ExpenseFutureProvider extends AutoDisposeFutureProvider<Expense> {
  /// See also [expenseFuture].
  ExpenseFutureProvider({
    this.id,
  }) : super.internal(
          (ref) => expenseFuture(
            ref,
            id: id,
          ),
          from: expenseFutureProvider,
          name: r'expenseFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseFutureHash,
          dependencies: ExpenseFutureFamily._dependencies,
          allTransitiveDependencies:
              ExpenseFutureFamily._allTransitiveDependencies,
        );

  final String? id;

  @override
  bool operator ==(Object other) {
    return other is ExpenseFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$expenseFormControllerHash() =>
    r'9eb1b3099292ff77f57c6bf0587bfd7e1f6ec339';

abstract class _$ExpenseFormController
    extends BuildlessAutoDisposeNotifier<Expense> {
  late final Expense arg;

  Expense build(
    Expense arg,
  );
}

/// See also [ExpenseFormController].
@ProviderFor(ExpenseFormController)
const expenseFormControllerProvider = ExpenseFormControllerFamily();

/// See also [ExpenseFormController].
class ExpenseFormControllerFamily extends Family<Expense> {
  /// See also [ExpenseFormController].
  const ExpenseFormControllerFamily();

  /// See also [ExpenseFormController].
  ExpenseFormControllerProvider call(
    Expense arg,
  ) {
    return ExpenseFormControllerProvider(
      arg,
    );
  }

  @override
  ExpenseFormControllerProvider getProviderOverride(
    covariant ExpenseFormControllerProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'expenseFormControllerProvider';
}

/// See also [ExpenseFormController].
class ExpenseFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<ExpenseFormController, Expense> {
  /// See also [ExpenseFormController].
  ExpenseFormControllerProvider(
    this.arg,
  ) : super.internal(
          () => ExpenseFormController()..arg = arg,
          from: expenseFormControllerProvider,
          name: r'expenseFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseFormControllerHash,
          dependencies: ExpenseFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ExpenseFormControllerFamily._allTransitiveDependencies,
        );

  final Expense arg;

  @override
  bool operator ==(Object other) {
    return other is ExpenseFormControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Expense runNotifierBuild(
    covariant ExpenseFormController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
