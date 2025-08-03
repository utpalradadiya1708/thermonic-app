import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/common/constants/app_constants.dart';

class Validator {
  static bool isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static bool isEmail(String em) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return !regex.hasMatch(em);
  }

  static bool isPassword(String value) {
    return value.length < 8;
  }

  static bool isValidLicense(String licenseNumber) {
    final RegExp regex = RegExp(r'^[A-Z]{3}\d{13}$');
    return regex.hasMatch(licenseNumber);
  }

  static bool checkIsMobileNumber(String value) {
    if (value.isNotEmpty) {
      final mobileRegex = RegExp(r'^[0-9]{2,13}$');
      return mobileRegex.hasMatch(value);
    }
    return false;
  }

  static bool checkIsEmail(String value) {
    if (value.isNotEmpty) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      return emailRegex.hasMatch(value);
    }
    return false;
  }

  static String? emptyValidator(String? value, String errorString) {
    return (value?.isEmpty ?? true) ? errorString : null;
  }

  static String? nationIdAndPassportValidator(String? value) {
    return (value?.isEmpty ?? true) ? 'lblEmptyNationalIdPassportNo'.tr : null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'lblEmptyEmail'.tr;
    } else if (isEmail(value)) {
      return 'lblValidEmail'.tr;
    }
    return null;
  }

  static String? kinEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'lblEmptyNextOfKinEmailAddressEmail'.tr;
    } else if (isEmail(value)) {
      return 'lblValidNextOfKinEmailAddressEmail'.tr;
    }
    return null;
  }

  static String? mobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'lblEmptyMobile'.tr;
    } else if (value.length > AppConstants.mobileNumber ||
        value.length < AppConstants.minMobileNumberLength) {
      return 'lblValidMobileNumber'.tr;
    }
    return null;
  }

  static String? alternateMobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'lblEmptyAlternateMobile'.tr;
    } else if (value.length > AppConstants.mobileNumber ||
        value.length < AppConstants.minMobileNumberLength) {
      return 'lblValidAlternateMobileNumber'.tr;
    }
    return null;
  }

  static String? mobileNumberOrEmailValidator(
    String? value,
    bool isMobileNumber,
  ) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (value == null || value.isEmpty) {
      return 'lblEmptyMobileNumberOrEmail'.tr;
    } else if (isMobileNumber &&
        (value.length > AppConstants.mobileNumber ||
            value.length < AppConstants.minMobileNumberLength)) {
      return 'lblValidMobileNumber'.tr;
    } else if (!emailRegex.hasMatch(value) && !isMobileNumber) {
      return 'lblValidEmail'.tr;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'lblEmptyPassword'.tr;
    } else if (value!.length < AppConstants.minPasswordLength) {
      return 'lblValidPassword'.tr;
    }
    return null;
  }

  static String? existingPasswordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'lblEmptyExistingPassword'.tr;
    } else if (value!.length < AppConstants.minPasswordLength) {
      return 'lblValidPassword'.tr;
    }
    return null;
  }

  static String? newPasswordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'lblEmptyNewPassword'.tr;
    } else if (value!.length < AppConstants.minPasswordLength) {
      return 'lblValidPassword'.tr;
    }
    return null;
  }

  static String? nameValidator(String? value) {
    return isEmpty(value) ? 'lblEmptyFullName'.tr : null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value?.isEmpty ?? true) {
      return 'lblEmptyConPassword'.tr;
    } else if (value!.length < 8) {
      return 'lblValidPassword'.tr;
    } else if (value != password) {
      return 'lblPasswordAndConPasswordNotMatch'.tr;
    }
    return null;
  }

  static String? messageValidator(String? value) {
    return isEmpty(value) ? 'lblPleaseEnterMessage'.tr : null;
  }

  static String? driverLicenseNoValidator(String? value) {
    if (isEmpty(value)) {
      return 'lblPleaseEnterDrivingLicenseNumber'.tr;
    } else if (value!.length < 16) {
      return 'lblPleaseEnterValidDrivingLicenseNumber'.tr;
    }
    return null;
  }

  static bool validateStructure(String value) {
    RegExp regExp = RegExp(r'^.{8,}$');
    return regExp.hasMatch(value);
  }
}

class InitialSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= 1 && newValue.text.contains(' ')) {
      return oldValue;
    }
    return newValue;
  }
}

class InitialZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= 1 && newValue.text.contains('0')) {
      return oldValue;
    }
    return newValue;
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  final RegExp noSpaceRegExp = RegExp(r'^[^\s]*$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return noSpaceRegExp.hasMatch(newValue.text) ? newValue : oldValue;
  }
}
