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

  static const String listYourPropertyTitle = 'List Your Property';
  static const String listYourPropertyStep1 = 'Step 1 of 8';
  static const String whatAreYouListing = 'What are you listing?';
  static const String forSale = 'For Sale';
  static const String forRent = 'For Rent';
  static const String propertyType = 'Property Type';
  static const String propertyApartment = 'Apartment';
  static const String propertyHouse = 'House';
  static const String propertyVilla = 'Villa';
  static const String propertyLand = 'Land';
  static const String propertyShop = 'Shop';
  static const String propertyOther = 'Other';
  static const String specifyPropertyType = 'Specify property type';
  static const String specifyPropertyTypeHint = 'e.g. Studio, Farm...';
  static const String continueText = 'Continue';
}