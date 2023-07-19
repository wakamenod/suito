// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'expense_schedule_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseScheduleFutureHash() =>
    r'3c7974ba5e56e2918c5e38fce3b9cfb81b13d3d1';

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

typedef ExpenseScheduleFutureRef
    = AutoDisposeFutureProviderRef<ExpenseSchedule>;

/// See also [expenseScheduleFuture].
@ProviderFor(expenseScheduleFuture)
const expenseScheduleFutureProvider = ExpenseScheduleFutureFamily();

/// See also [expenseScheduleFuture].
class ExpenseScheduleFutureFamily extends Family<AsyncValue<ExpenseSchedule>> {
  /// See also [expenseScheduleFuture].
  const ExpenseScheduleFutureFamily();

  /// See also [expenseScheduleFuture].
  ExpenseScheduleFutureProvider call({
    String? id,
  }) {
    return ExpenseScheduleFutureProvider(
      id: id,
    );
  }

  @override
  ExpenseScheduleFutureProvider getProviderOverride(
    covariant ExpenseScheduleFutureProvider provider,
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
  String? get name => r'expenseScheduleFutureProvider';
}

/// See also [expenseScheduleFuture].
class ExpenseScheduleFutureProvider
    extends AutoDisposeFutureProvider<ExpenseSchedule> {
  /// See also [expenseScheduleFuture].
  ExpenseScheduleFutureProvider({
    this.id,
  }) : super.internal(
          (ref) => expenseScheduleFuture(
            ref,
            id: id,
          ),
          from: expenseScheduleFutureProvider,
          name: r'expenseScheduleFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseScheduleFutureHash,
          dependencies: ExpenseScheduleFutureFamily._dependencies,
          allTransitiveDependencies:
              ExpenseScheduleFutureFamily._allTransitiveDependencies,
        );

  final String? id;

  @override
  bool operator ==(Object other) {
    return other is ExpenseScheduleFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$expenseScheduleFormControllerHash() =>
    r'fb764a8d0dfe1af5e044ecb9baeb30a203119aa6';

abstract class _$ExpenseScheduleFormController
    extends BuildlessAutoDisposeNotifier<ExpenseSchedule> {
  late final ExpenseSchedule arg;

  ExpenseSchedule build(
    ExpenseSchedule arg,
  );
}

/// See also [ExpenseScheduleFormController].
@ProviderFor(ExpenseScheduleFormController)
const expenseScheduleFormControllerProvider =
    ExpenseScheduleFormControllerFamily();

/// See also [ExpenseScheduleFormController].
class ExpenseScheduleFormControllerFamily extends Family<ExpenseSchedule> {
  /// See also [ExpenseScheduleFormController].
  const ExpenseScheduleFormControllerFamily();

  /// See also [ExpenseScheduleFormController].
  ExpenseScheduleFormControllerProvider call(
    ExpenseSchedule arg,
  ) {
    return ExpenseScheduleFormControllerProvider(
      arg,
    );
  }

  @override
  ExpenseScheduleFormControllerProvider getProviderOverride(
    covariant ExpenseScheduleFormControllerProvider provider,
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
  String? get name => r'expenseScheduleFormControllerProvider';
}

/// See also [ExpenseScheduleFormController].
class ExpenseScheduleFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<ExpenseScheduleFormController,
        ExpenseSchedule> {
  /// See also [ExpenseScheduleFormController].
  ExpenseScheduleFormControllerProvider(
    this.arg,
  ) : super.internal(
          () => ExpenseScheduleFormController()..arg = arg,
          from: expenseScheduleFormControllerProvider,
          name: r'expenseScheduleFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseScheduleFormControllerHash,
          dependencies: ExpenseScheduleFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ExpenseScheduleFormControllerFamily._allTransitiveDependencies,
        );

  final ExpenseSchedule arg;

  @override
  bool operator ==(Object other) {
    return other is ExpenseScheduleFormControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ExpenseSchedule runNotifierBuild(
    covariant ExpenseScheduleFormController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
