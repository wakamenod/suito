import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/features/authentication/auth_redirect.dart';
import 'package:suito/src/features/authentication/services/auth_error.dart';
import 'package:suito/src/formz/email.dart';
import 'package:suito/src/formz/password.dart';

part 'auth_controller.g.dart';

enum AuthMode { signIn, signUp }

/// Outcome of [AuthSubmitController.submit]. The caller has to tell a plain
/// success apart from one that still needs a confirmation click, and from a
/// failure -- the error itself lives in the controller's [AsyncValue].
enum AuthSubmitResult {
  /// Signed in / signed up and a session is live.
  success,

  /// Sign-up accepted, but Supabase issued no session until the emailed link
  /// is clicked.
  needsEmailConfirmation,

  /// Rejected by Supabase, or the form never passed validation.
  failed,
}

@immutable
class AuthFormValue {
  const AuthFormValue({
    this.mode = AuthMode.signIn,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  final AuthMode mode;
  final Email email;
  final Password password;

  bool get isSignUp => mode == AuthMode.signUp;
  bool get isValid => Formz.validate([email, password]);

  AuthFormValue copyWith({AuthMode? mode, Email? email, Password? password}) =>
      AuthFormValue(
        mode: mode ?? this.mode,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}

/// Holds the email/password form state and the sign-in/sign-up mode.
@riverpod
class AuthFormController extends _$AuthFormController {
  @override
  AuthFormValue build() => const AuthFormValue();

  void onChangeEmail(String value) {
    _clearSubmitError();
    state = state.copyWith(email: Email.dirty(value));
  }

  void onChangePassword(String value) {
    _clearSubmitError();
    state = state.copyWith(password: Password.dirty(value));
  }

  void toggleMode() {
    _clearSubmitError();
    state = state.copyWith(
      mode: state.isSignUp ? AuthMode.signIn : AuthMode.signUp,
    );
  }

  /// Mark both fields dirty so validation messages surface on a submit attempt.
  void touch() => state = state.copyWith(
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
      );

  /// A previous failure describes credentials the user has since changed, so it
  /// must not outlive the edit -- otherwise "The email or password is
  /// incorrect." stays on screen after switching to sign-up.
  void _clearSubmitError() =>
      ref.read(authSubmitControllerProvider.notifier).clearError();
}

/// Runs the Supabase auth call. State is `AsyncValue<void>` so a failure lands
/// on the standard `AsyncErrorLogger` path; the screen also reads `.isLoading`
/// and `.error`.
@riverpod
class AuthSubmitController extends _$AuthSubmitController {
  /// A success flips the session, which makes the router's redirect guard leave
  /// the sign-in screen -- disposing this autoDispose notifier while the call
  /// is still in flight. Writes to `state` after that never reach a listener.
  var _alive = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _alive = false);
  }

  Future<AuthSubmitResult> submit(AuthFormValue form) async {
    if (!form.isValid) return AuthSubmitResult.failed;

    state = const AsyncLoading();
    final auth = ref.read(supabaseAuthProvider);

    var needsEmailConfirmation = false;
    // Explicit <void>: inferred from the closure this is AsyncValue<Null>,
    // which AsyncNotifier rejects when it merges the previous AsyncLoading<void>.
    final result = await AsyncValue.guard<void>(() async {
      try {
        if (form.isSignUp) {
          final res = await auth.signUp(
            email: form.email.value,
            password: form.password.value,
            // Without this the confirmation link opens Supabase's Site URL (a
            // web page) instead of coming back to the app.
            emailRedirectTo: kAuthRedirectUrl,
          );
          needsEmailConfirmation = res.session == null;
        } else {
          await auth.signInWithPassword(
            email: form.email.value,
            password: form.password.value,
          );
        }
      } on AuthException catch (e) {
        throw toAuthAppException(e);
      }
    });

    if (_alive) state = result;

    if (result.hasError) return AuthSubmitResult.failed;
    return needsEmailConfirmation
        ? AuthSubmitResult.needsEmailConfirmation
        : AuthSubmitResult.success;
  }

  void clearError() {
    if (_alive && state.hasError) state = const AsyncData(null);
  }
}

/// Sends the "set a new password" email. Kept separate from
/// [AuthSubmitController] so a reset failure can't overwrite the sign-in form's
/// error, and vice versa.
@riverpod
class PasswordResetController extends _$PasswordResetController {
  var _alive = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _alive = false);
  }

  /// Returns `true` when the email was accepted.
  Future<bool> sendResetEmail(Email email) async {
    if (!email.isValid) return false;

    state = const AsyncLoading();
    final auth = ref.read(supabaseAuthProvider);

    // Explicit <void>: inferred from the closure this is AsyncValue<Null>,
    // which AsyncNotifier rejects when it merges the previous AsyncLoading<void>.
    final result = await AsyncValue.guard<void>(() async {
      try {
        await auth.resetPasswordForEmail(
          email.value,
          redirectTo: kAuthRedirectUrl,
        );
      } on AuthException catch (e) {
        throw toAuthAppException(e);
      }
    });

    if (_alive) state = result;
    return !result.hasError;
  }
}

/// Sign-out action, kept as `AsyncValue<void>` for consistent error handling.
@riverpod
class SignOutController extends _$SignOutController {
  /// gotrue emits `signedOut` *before* it awaits the network call, so by the
  /// time this completes the router has usually navigated away and disposed
  /// this autoDispose notifier.
  var _alive = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _alive = false);
  }

  Future<void> signOut() async {
    final auth = ref.read(supabaseAuthProvider);
    state = const AsyncLoading();
    // Explicit <void>: see AuthSubmitController.submit.
    final result = await AsyncValue.guard<void>(() => auth.signOut());
    if (_alive) state = result;
  }
}
