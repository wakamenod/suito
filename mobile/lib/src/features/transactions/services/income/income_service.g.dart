// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'income_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incomeControllerHash() => r'7a4f15dbd90cb32aa35dd2c185a41af1ab68c15f';

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

abstract class _$IncomeController
    extends BuildlessAutoDisposeAsyncNotifier<Income> {
  late final String arg;

  FutureOr<Income> build(
    String arg,
  );
}

/// See also [IncomeController].
@ProviderFor(IncomeController)
const incomeControllerProvider = IncomeControllerFamily();

/// See also [IncomeController].
class IncomeControllerFamily extends Family<AsyncValue<Income>> {
  /// See also [IncomeController].
  const IncomeControllerFamily();

  /// See also [IncomeController].
  IncomeControllerProvider call(
    String arg,
  ) {
    return IncomeControllerProvider(
      arg,
    );
  }

  @override
  IncomeControllerProvider getProviderOverride(
    covariant IncomeControllerProvider provider,
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
  String? get name => r'incomeControllerProvider';
}

/// See also [IncomeController].
class IncomeControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<IncomeController, Income> {
  /// See also [IncomeController].
  IncomeControllerProvider(
    this.arg,
  ) : super.internal(
          () => IncomeController()..arg = arg,
          from: incomeControllerProvider,
          name: r'incomeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomeControllerHash,
          dependencies: IncomeControllerFamily._dependencies,
          allTransitiveDependencies:
              IncomeControllerFamily._allTransitiveDependencies,
        );

  final String arg;

  @override
  bool operator ==(Object other) {
    return other is IncomeControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Income> runNotifierBuild(
    covariant IncomeController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
