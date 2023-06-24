// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'expense_schedule_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseScheduleControllerHash() =>
    r'30deacf7c319ba481d268dc40de985b9329633a6';

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

abstract class _$ExpenseScheduleController
    extends BuildlessAutoDisposeAsyncNotifier<ExpenseSchedule> {
  late final String arg;

  FutureOr<ExpenseSchedule> build(
    String arg,
  );
}

/// See also [ExpenseScheduleController].
@ProviderFor(ExpenseScheduleController)
const expenseScheduleControllerProvider = ExpenseScheduleControllerFamily();

/// See also [ExpenseScheduleController].
class ExpenseScheduleControllerFamily
    extends Family<AsyncValue<ExpenseSchedule>> {
  /// See also [ExpenseScheduleController].
  const ExpenseScheduleControllerFamily();

  /// See also [ExpenseScheduleController].
  ExpenseScheduleControllerProvider call(
    String arg,
  ) {
    return ExpenseScheduleControllerProvider(
      arg,
    );
  }

  @override
  ExpenseScheduleControllerProvider getProviderOverride(
    covariant ExpenseScheduleControllerProvider provider,
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
  String? get name => r'expenseScheduleControllerProvider';
}

/// See also [ExpenseScheduleController].
class ExpenseScheduleControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ExpenseScheduleController,
        ExpenseSchedule> {
  /// See also [ExpenseScheduleController].
  ExpenseScheduleControllerProvider(
    this.arg,
  ) : super.internal(
          () => ExpenseScheduleController()..arg = arg,
          from: expenseScheduleControllerProvider,
          name: r'expenseScheduleControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseScheduleControllerHash,
          dependencies: ExpenseScheduleControllerFamily._dependencies,
          allTransitiveDependencies:
              ExpenseScheduleControllerFamily._allTransitiveDependencies,
        );

  final String arg;

  @override
  bool operator ==(Object other) {
    return other is ExpenseScheduleControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ExpenseSchedule> runNotifierBuild(
    covariant ExpenseScheduleController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
