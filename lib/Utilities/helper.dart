import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify/Utilities/shared_preferences.dart';
import 'package:hypelify/Utilities/strings.dart';
import 'package:hypelify/Utilities/toast_helper.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';





extension StringExtention on String {
  get toDay => DateFormat('EEE').format(DateTime.parse(this));

  get toDate => DateFormat('dd MMMM').format(DateTime.parse(this));

  get toLocalDate => DateTime.parse(this).toUtc().toString();

  get toDateTime => DateFormat('yyyy-MM-dd hh:mm').format(DateTime.parse(this));

  toDateDDMMYYYY({withDashes = true}) {
    if (this == 'null') {
      return null;
    } else if (DateTime.tryParse(this) != null) {
      if (withDashes) {
        return DateFormat('dd-MMM-yyyy').format(DateTime.parse(this));
      } else {
        return DateFormat('dd MMM yyyy').format(DateTime.parse(this));
      }
    } else {
      return this;
    }
  }

  get toTime => DateFormat('HH:mm').format(DateTime.parse(this));
}

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Helper {
  static final formatter = DateFormat('yyyy-MM-dd');
  static final formatterHM = DateFormat('hh:mm', SharedPref.getLanguage() ?? 'en');
  static final formatterHHmm = DateFormat.jm(SharedPref.getLanguage() ?? 'en');
  static final formatterM = DateFormat('dd-MMM-yyyy', SharedPref.getLanguage() ?? 'en');


  static DateTime getTimeZone(DateTime dateTime) => dateTime.toLocal();

  static const String allSportsHolder =
      "https://cdn-icons-png.flaticon.com/512/2270/2270989.png";

  static const String imagePlaceHolder =
      "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";

  static const String smallImagePlaceHolder =
      "https://c4s-player.s3.amazonaws.com/product-newww.png";

  static const String profilePlaceHolder =
      "https://scai.kibu.ac.ke/wp-content/uploads/2021/10/NoProfile.png";

  static paymentReDirect(String url,
      {Function? onSuccess, Function? onFailed, Function? onCanceled}) {
    // if (url.contains("/payment/failed/")) {
    //   if (onFailed != null) onFailed();
    // } else if (url.contains("Transaction successful")) {
    if (onSuccess != null) onSuccess();
    // } else if (url.contains("/payment/canceled/")) {
    //   if (onCanceled != null) onCanceled();
    // }
  }




  static Future showDialogWidget(
      {required BuildContext context,
      Function()? onDismiss,
      required Widget child}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: child,
        );
      },
    ).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }

  // static List handleListError(var errorObject) {
  //   List keys = errorObject.keys.toList();
  //   List errorMessages = keys.map((e) => errorObject[e].first).toList();
  //   return errorMessages;
  // }

  static handleErrorMessage(String error) {
    ToastHelper.showError(message: (error.tr).isEmpty ? error : error.tr);
  }

  static Future<DateTime?> pickDate(BuildContext context) async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
  }

  static showBottomSheetWithDynamicHeight({
    required BuildContext context,
    required Widget widget,
    double? width,radius,
    Function? onDismiss,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(radius??10.w))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        builder: (BuildContext context) => widget).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }

  static handleError(var result) {
    if (result.runtimeType == String) {
      ToastHelper.showError(message: result ?? "");
    } else if (result.runtimeType == List){
      ToastHelper.showError(
          message: result.join('!@#').replaceAll('!@#', "'\n"));
    }else{
      ToastHelper.showError(message: result ?? "");
    }
  }


  static Future<void> startFlexibleUpdate() async {
    if(!Platform.isAndroid) return;
    try{
      final checker = await InAppUpdate.checkForUpdate();
      if(checker.updateAvailability.value > 0){
        // await InAppUpdate.startFlexibleUpdate();
        await InAppUpdate.performImmediateUpdate();
        await InAppUpdate.completeFlexibleUpdate();
      }
    }catch(e){}
  }

}
