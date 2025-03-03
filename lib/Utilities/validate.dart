

import 'package:atm/Utilities/strings.dart';
import 'package:atm/core/Language/locales.dart';

class Validate {
  static RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@?#\$&*~]).{8,}$');

  static bool validateConfPassword(
      {required String? newPassword, required String? confPassword}) {
    return (newPassword == confPassword);
  }

  static String? validateNormalString(String? text) {
    if (text == null || text.isEmpty) return '';
    return null;
  }
  static String? validateEmailString(String? text) {
    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (text == null || text.isEmpty) {
      return Strings.emailCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return Strings.emailValidate.tr;
      } else {
        return null;
      }
    }
  }
  static String? validateNameString(String? text) {
    RegExp regex =RegExp('[a-zA-Zء-ي]');
    if (text == null || text.isEmpty) {
      return Strings.nameCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return Strings.nameValidate.tr;
      } else {
        return null;
      }
    }
  }
  static String? validateLinkString(String? text) {
    RegExp regex =RegExp('[a-zA-Zء-ي]');
    if (text == null || text.isEmpty) {
      return Strings.linkCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return Strings.linkValidate.tr;
      } else {
        return null;
      }
    }
  }
  static String? validateDescriptionString(String? text) {
    RegExp regex =RegExp('[a-zA-Zء-ي]');
    if (text == null || text.isEmpty) {
      return Strings.descriptionCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return Strings.descriptionValidate.tr;
      } else {
        return null;
      }
    }
  }

  static String? validatePhoneString(String? text) {
    // RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)');
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regex = RegExp(pattern);
    if (text == null || text.isEmpty) {
      return Strings.phoneNumberCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return Strings.phoneValidate.tr;
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return Strings.passwordCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return '';
      } else {
        return null;
      }
    }
  }
  static String? validatePasswordLogin(String? text) {
    if (text == null || text.isEmpty) {
      return Strings.passwordCannotBeEmpty.tr;
    } else {
      if (!regex.hasMatch(text)) {
        return Strings.invalidPassword.tr;
      } else {
        return null;
      }
    }
  }


}
