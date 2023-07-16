// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'income_schedule_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incomeScheduleControllerHash() =>
    r'e031d89a622691dde7562ee13ca0f44033071b54';

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

abstract class _$IncomeScheduleController
    extends BuildlessAutoDisposeAsyncNotifier<IncomeSchedule> {
  late final String arg;

  FutureOr<IncomeSchedule> build(
    String arg,
  );
}

/// See also [IncomeScheduleController].
@ProviderFor(IncomeScheduleController)
const incomeScheduleControllerProvider = IncomeScheduleControllerFamily();

/// See also [IncomeScheduleController].
class IncomeScheduleControllerFamily
    extends Family<AsyncValue<IncomeSchedule>> {
  /// See also [IncomeScheduleController].
  const IncomeScheduleControllerFamily();

  /// See also [IncomeScheduleController].
  IncomeScheduleControllerProvider call(
    String arg,
  ) {
    return IncomeScheduleControllerProvider(
      arg,
    );
  }

  @override
  IncomeScheduleControllerProvider getProviderOverride(
    covariant IncomeScheduleControllerProvider provider,
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
  String? get name => r'incomeScheduleControllerProvider';
}

/// See also [IncomeScheduleController].
class IncomeScheduleControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<IncomeScheduleController,
        IncomeSchedule> {
  /// See also [IncomeScheduleController].
  IncomeScheduleControllerProvider(
    this.arg,
  ) : super.internal(
          () => IncomeScheduleController()..arg = arg,
          from: incomeScheduleControllerProvider,
          name: r'incomeScheduleControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomeScheduleControllerHash,
          dependencies: IncomeScheduleControllerFamily._dependencies,
          allTransitiveDependencies:
              IncomeScheduleControllerFamily._allTransitiveDependencies,
        );

  final String arg;

  @override
  bool operator ==(Object other) {
    return other is IncomeScheduleControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<IncomeSchedule> runNotifierBuild(
    covariant IncomeScheduleController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
