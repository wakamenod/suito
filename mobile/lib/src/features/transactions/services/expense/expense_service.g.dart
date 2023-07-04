// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'expense_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseControllerHash() => r'100f0aa23d68b46022841df74b272eaa13d187d1';

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

abstract class _$ExpenseController
    extends BuildlessAutoDisposeAsyncNotifier<Expense> {
  late final String arg;

  FutureOr<Expense> build(
    String arg,
  );
}

/// See also [ExpenseController].
@ProviderFor(ExpenseController)
const expenseControllerProvider = ExpenseControllerFamily();

/// See also [ExpenseController].
class ExpenseControllerFamily extends Family<AsyncValue<Expense>> {
  /// See also [ExpenseController].
  const ExpenseControllerFamily();

  /// See also [ExpenseController].
  ExpenseControllerProvider call(
    String arg,
  ) {
    return ExpenseControllerProvider(
      arg,
    );
  }

  @override
  ExpenseControllerProvider getProviderOverride(
    covariant ExpenseControllerProvider provider,
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
  String? get name => r'expenseControllerProvider';
}

/// See also [ExpenseController].
class ExpenseControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ExpenseController, Expense> {
  /// See also [ExpenseController].
  ExpenseControllerProvider(
    this.arg,
  ) : super.internal(
          () => ExpenseController()..arg = arg,
          from: expenseControllerProvider,
          name: r'expenseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseControllerHash,
          dependencies: ExpenseControllerFamily._dependencies,
          allTransitiveDependencies:
              ExpenseControllerFamily._allTransitiveDependencies,
        );

  final String arg;

  @override
  bool operator ==(Object other) {
    return other is ExpenseControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Expense> runNotifierBuild(
    covariant ExpenseController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
