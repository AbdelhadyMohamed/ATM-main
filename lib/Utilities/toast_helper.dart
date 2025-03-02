import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hypelify/Utilities/router_config.dart';
import 'package:hypelify/Utilities/strings.dart';
import 'package:hypelify/Utilities/theme_helper.dart';

class ToastHelper{

  static Future showError({required String? message,Color? backgroundColor})async{
    await Fluttertoast.showToast(
      msg: message ?? Strings.errorMessage.tr,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor??Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static Future showSuccess({required String? message,Color? backgroundColor})async{
    await Fluttertoast.showToast(
        msg: message??"success",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: backgroundColor??ThemeClass.of(currentContext_!).primaryColor,
        textColor: Colors.white,
        fontSize: 16.sp
    );
  }
}