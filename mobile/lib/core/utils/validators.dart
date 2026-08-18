import 'package:flutter/widgets.dart';
import 'package:mobile/core/constant/strings.dart';


/// Precompiled regex patterns.
/// Kept as top-level `static final` so they are compiled once, not on
/// every validation call.
class _ValidatorPatterns {
  _ValidatorPatterns._();

  static final RegExp email = RegExp(r'^[\w.-]+@[\w.-]+\.\w{2,}$');
  static final RegExp upperCase = RegExp(r'[A-Z]');
  static final RegExp lowerCase = RegExp(r'[a-z]');
  static final RegExp digit = RegExp(r'[0-9]');
  static final RegExp specialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]');
}


extension StringValidators on String? {
  bool get _isBlank => this == null || this!.trim().isEmpty;

  /// Generic "required" check. Used internally, but also exposed in
  /// case you just need a plain "not empty" validator somewhere.
  String? validateRequired(BuildContext context) {
    if (_isBlank) return AppStrings.textFieldErrorEmpty;
    return null;
  }

  String? validateName(BuildContext context) => validateRequired(context);

  String? validatePhone(BuildContext context) => validateRequired(context);

  String? validateCompanyId(BuildContext context) => validateRequired(context);

  String? validateEmail(BuildContext context) {
    if (_isBlank) return AppStrings.emailIsRequired;
    if (!_ValidatorPatterns.email.hasMatch(this!.trim())) {
      return AppStrings.textFieldWrongEmail;
    }
    return null;
  }


  String? validateLoginPassword(BuildContext context) {
    if (_isBlank) return AppStrings.passwordLogin;
    return null;
  }

  /// Strong password:
  /// - At least 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one digit
  /// - At least one special character
  String? validatePassword(BuildContext context) {
    if (_isBlank) return AppStrings.textFieldErrorEmpty;

    final value = this!;
    if (value.length < 8) {
      return AppStrings.passwordMustHave8Char;
    }
    if (!_ValidatorPatterns.upperCase.hasMatch(value)) {
      return AppStrings.passwordMustHaveUpperChar;
    }
    if (!_ValidatorPatterns.lowerCase.hasMatch(value)) {
      return AppStrings.passwordMustHaveLowerChar;
    }
    if (!_ValidatorPatterns.digit.hasMatch(value)) {
      return AppStrings.passwordMustHaveNum;
    }
    if (!_ValidatorPatterns.specialChar.hasMatch(value)) {
      return AppStrings.passwordMustHaveSpecialChar;
    }
    return null;
  }

  String? validateConfirmPassword(
      String? originalPassword,
      BuildContext context,
      ) {
    if (_isBlank) return AppStrings.textFieldErrorEmpty;
    if (this != originalPassword) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }
}