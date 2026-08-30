// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authFormControllerHash() =>
    r'2164cba798a05b13805be2655c66898fa9714c7e';

/// Holds the email/password form state and the sign-in/sign-up mode.
///
/// Copied from [AuthFormController].
@ProviderFor(AuthFormController)
final authFormControllerProvider =
    AutoDisposeNotifierProvider<AuthFormController, AuthFormValue>.internal(
  AuthFormController.new,
  name: r'authFormControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authFormControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthFormController = AutoDisposeNotifier<AuthFormValue>;
String _$authSubmitControllerHash() =>
    r'7abbc1029dd73ee42dba3b80ecf6f12735b8d6fd';

/// Runs the Supabase auth call. State is `AsyncValue<void>` so a failure lands
/// on the standard `AsyncErrorLogger` path; the screen also reads `.isLoading`
/// and `.error`.
///
/// Copied from [AuthSubmitController].
@ProviderFor(AuthSubmitController)
final authSubmitControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthSubmitController, void>.internal(
  AuthSubmitController.new,
  name: r'authSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthSubmitController = AutoDisposeAsyncNotifier<void>;
String _$passwordResetControllerHash() =>
    r'1cebfc9e0e51b2a5747758eadb60486f54f5a72d';

/// Sends the "set a new password" email. Kept separate from
/// [AuthSubmitController] so a reset failure can't overwrite the sign-in form's
/// error, and vice versa.
///
/// Copied from [PasswordResetController].
@ProviderFor(PasswordResetController)
final passwordResetControllerProvider =
    AutoDisposeAsyncNotifierProvider<PasswordResetController, void>.internal(
  PasswordResetController.new,
  name: r'passwordResetControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordResetControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordResetController = AutoDisposeAsyncNotifier<void>;
String _$signOutControllerHash() => r'c7059898d05546c4081c0d2bd23f925f6a6d8393';

/// Sign-out action, kept as `AsyncValue<void>` for consistent error handling.
///
/// Copied from [SignOutController].
@ProviderFor(SignOutController)
final signOutControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignOutController, void>.internal(
  SignOutController.new,
  name: r'signOutControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignOutController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
