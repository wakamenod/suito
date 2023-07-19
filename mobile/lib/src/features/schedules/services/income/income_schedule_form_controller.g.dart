// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'income_schedule_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incomeScheduleFutureHash() =>
    r'2188a7127ebe02bc9fc215e18db61293ae293a0c';

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

typedef IncomeScheduleFutureRef = AutoDisposeFutureProviderRef<IncomeSchedule>;

/// See also [incomeScheduleFuture].
@ProviderFor(incomeScheduleFuture)
const incomeScheduleFutureProvider = IncomeScheduleFutureFamily();

/// See also [incomeScheduleFuture].
class IncomeScheduleFutureFamily extends Family<AsyncValue<IncomeSchedule>> {
  /// See also [incomeScheduleFuture].
  const IncomeScheduleFutureFamily();

  /// See also [incomeScheduleFuture].
  IncomeScheduleFutureProvider call({
    String? id,
  }) {
    return IncomeScheduleFutureProvider(
      id: id,
    );
  }

  @override
  IncomeScheduleFutureProvider getProviderOverride(
    covariant IncomeScheduleFutureProvider provider,
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
  String? get name => r'incomeScheduleFutureProvider';
}

/// See also [incomeScheduleFuture].
class IncomeScheduleFutureProvider
    extends AutoDisposeFutureProvider<IncomeSchedule> {
  /// See also [incomeScheduleFuture].
  IncomeScheduleFutureProvider({
    this.id,
  }) : super.internal(
          (ref) => incomeScheduleFuture(
            ref,
            id: id,
          ),
          from: incomeScheduleFutureProvider,
          name: r'incomeScheduleFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomeScheduleFutureHash,
          dependencies: IncomeScheduleFutureFamily._dependencies,
          allTransitiveDependencies:
              IncomeScheduleFutureFamily._allTransitiveDependencies,
        );

  final String? id;

  @override
  bool operator ==(Object other) {
    return other is IncomeScheduleFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$incomeScheduleFormControllerHash() =>
    r'85f7a50e78c086595aaa1aa5f69ceb646657e4f2';

abstract class _$IncomeScheduleFormController
    extends BuildlessAutoDisposeNotifier<IncomeSchedule> {
  late final IncomeSchedule arg;

  IncomeSchedule build(
    IncomeSchedule arg,
  );
}

/// See also [IncomeScheduleFormController].
@ProviderFor(IncomeScheduleFormController)
const incomeScheduleFormControllerProvider =
    IncomeScheduleFormControllerFamily();

/// See also [IncomeScheduleFormController].
class IncomeScheduleFormControllerFamily extends Family<IncomeSchedule> {
  /// See also [IncomeScheduleFormController].
  const IncomeScheduleFormControllerFamily();

  /// See also [IncomeScheduleFormController].
  IncomeScheduleFormControllerProvider call(
    IncomeSchedule arg,
  ) {
    return IncomeScheduleFormControllerProvider(
      arg,
    );
  }

  @override
  IncomeScheduleFormControllerProvider getProviderOverride(
    covariant IncomeScheduleFormControllerProvider provider,
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
  String? get name => r'incomeScheduleFormControllerProvider';
}

/// See also [IncomeScheduleFormController].
class IncomeScheduleFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<IncomeScheduleFormController,
        IncomeSchedule> {
  /// See also [IncomeScheduleFormController].
  IncomeScheduleFormControllerProvider(
    this.arg,
  ) : super.internal(
          () => IncomeScheduleFormController()..arg = arg,
          from: incomeScheduleFormControllerProvider,
          name: r'incomeScheduleFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomeScheduleFormControllerHash,
          dependencies: IncomeScheduleFormControllerFamily._dependencies,
          allTransitiveDependencies:
              IncomeScheduleFormControllerFamily._allTransitiveDependencies,
        );

  final IncomeSchedule arg;

  @override
  bool operator ==(Object other) {
    return other is IncomeScheduleFormControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  IncomeSchedule runNotifierBuild(
    covariant IncomeScheduleFormController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
