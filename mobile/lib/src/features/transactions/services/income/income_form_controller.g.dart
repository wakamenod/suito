// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'income_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incomeFutureHash() => r'6ae77ee223c3d79c76f64b7a06429c49afaf0d7b';

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

typedef IncomeFutureRef = AutoDisposeFutureProviderRef<Income>;

/// See also [incomeFuture].
@ProviderFor(incomeFuture)
const incomeFutureProvider = IncomeFutureFamily();

/// See also [incomeFuture].
class IncomeFutureFamily extends Family<AsyncValue<Income>> {
  /// See also [incomeFuture].
  const IncomeFutureFamily();

  /// See also [incomeFuture].
  IncomeFutureProvider call({
    String? id,
  }) {
    return IncomeFutureProvider(
      id: id,
    );
  }

  @override
  IncomeFutureProvider getProviderOverride(
    covariant IncomeFutureProvider provider,
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
  String? get name => r'incomeFutureProvider';
}

/// See also [incomeFuture].
class IncomeFutureProvider extends AutoDisposeFutureProvider<Income> {
  /// See also [incomeFuture].
  IncomeFutureProvider({
    this.id,
  }) : super.internal(
          (ref) => incomeFuture(
            ref,
            id: id,
          ),
          from: incomeFutureProvider,
          name: r'incomeFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomeFutureHash,
          dependencies: IncomeFutureFamily._dependencies,
          allTransitiveDependencies:
              IncomeFutureFamily._allTransitiveDependencies,
        );

  final String? id;

  @override
  bool operator ==(Object other) {
    return other is IncomeFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$incomeFormControllerHash() =>
    r'aa3320e71db9fee93d7ff8e6559100d2d1d29411';

abstract class _$IncomeFormController
    extends BuildlessAutoDisposeNotifier<Income> {
  late final Income arg;

  Income build(
    Income arg,
  );
}

/// See also [IncomeFormController].
@ProviderFor(IncomeFormController)
const incomeFormControllerProvider = IncomeFormControllerFamily();

/// See also [IncomeFormController].
class IncomeFormControllerFamily extends Family<Income> {
  /// See also [IncomeFormController].
  const IncomeFormControllerFamily();

  /// See also [IncomeFormController].
  IncomeFormControllerProvider call(
    Income arg,
  ) {
    return IncomeFormControllerProvider(
      arg,
    );
  }

  @override
  IncomeFormControllerProvider getProviderOverride(
    covariant IncomeFormControllerProvider provider,
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
  String? get name => r'incomeFormControllerProvider';
}

/// See also [IncomeFormController].
class IncomeFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<IncomeFormController, Income> {
  /// See also [IncomeFormController].
  IncomeFormControllerProvider(
    this.arg,
  ) : super.internal(
          () => IncomeFormController()..arg = arg,
          from: incomeFormControllerProvider,
          name: r'incomeFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomeFormControllerHash,
          dependencies: IncomeFormControllerFamily._dependencies,
          allTransitiveDependencies:
              IncomeFormControllerFamily._allTransitiveDependencies,
        );

  final Income arg;

  @override
  bool operator ==(Object other) {
    return other is IncomeFormControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Income runNotifierBuild(
    covariant IncomeFormController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
