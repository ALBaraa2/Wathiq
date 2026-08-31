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
  static const String passwordMustHaveNum = 'Password must contain a number';
  static const String passwordMustHaveSpecialChar =
      'Password must contain a special character';
  static const String passwordMismatch = 'Passwords do not match';

  static const String listYourPropertyTitle = 'List Your Property';
  static const String listYourPropertyStep1 = 'Step 1 of 6';

  static const String listYourPropertyPage2Title = 'Location Details';
  static const String listYourPropertyStep2 = 'Step 2 of 6';
  static const String listYourPropertyStep3 = 'Step 3 of 6';

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
  static const String city = 'City';
  static const String district = 'District';
  static const String buildingNumber = 'Building Number';
  static const String area = 'Area (m²)';
  static const String price = 'Price';
  static const String floor = 'Floor';
  static const String rooms = 'Rooms';
  static const String bathrooms = 'Bathrooms';

    static const String buildingNumberHint = 'e.g. 12';
  static const String areaHint = 'e.g. 150';
  static const String priceHint =  'e.g. 85000';
  static const String floorHint = 'e.g. 3';
 


  static const String elevator = 'Elevator';
  static const String parking = 'Parking';
  static const String electricity = 'Electricity';
  static const String wifi = 'Internet';
  static const String water = 'Water';
  static const String furnished = 'Furnished';
  static const String garden = 'Garden';
  static const String description = 'Description';
  static const String descriptionHint =
      'Tell buyers about the property — layout, condition, nearby landmarks...';

  static const String   features =  'Features';
}
