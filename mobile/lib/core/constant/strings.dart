/// Centralized app strings.
///
/// This is a temporary, non-localized string source. Once
/// `AppLocalizations` is wired up (via `flutter gen-l10n`), replace the
/// values below with calls to `AppLocalizations.of(context)!.xxx` inside
/// each getter/method that needs it — call sites elsewhere in the app
/// (e.g. `validators.dart`) won't need to change, since they already
/// pass `BuildContext` through.
class AppStrings {
  AppStrings._();

  // Generic
  static const String textFieldErrorEmpty = 'This field is required';

  // Email
  static const String emailIsRequired = 'Email is required';
  static const String textFieldWrongEmail = 'Enter a valid email address';

  // Password
  static const String passwordLogin = 'Password is required';
  static const String passwordMustHave8Char =
      'Password must be at least 8 characters';
  static const String passwordMustHaveUpperChar =
      'Password must contain an uppercase letter';
  static const String passwordMustHaveLowerChar =
      'Password must contain a lowercase letter';
  static const String passwordMustHaveNum =
      'Password must contain a number';
  static const String passwordMustHaveSpecialChar =
      'Password must contain a special character';
  static const String passwordMismatch = 'Passwords do not match';
}