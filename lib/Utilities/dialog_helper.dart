import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify/Utilities/theme_helper.dart';
import '../core/network/error_message_model.dart';

class DialogsHelper{
  final BuildContext context;
  final String message;
  final String? title;
  final Function()? onDismiss;
  final ErrorMessageModel? _errorModel;

  DialogsHelper.infoBar({
    required this.context,
    this.message = "",
    required this.title,
    this.onDismiss,
  }) : _errorModel = null;

  DialogsHelper.dialog({required this.context, this.message = "", this.title, this.onDismiss}) : _errorModel = null;

  DialogsHelper.errorModel({required this.context, required ErrorMessageModel errorModel, this.onDismiss})
      : _errorModel = errorModel,
        message = "",
        title = null;

  static BoxDecoration defaultDecoration(BuildContext context) => BoxDecoration(
    border: Border.all(color: Colors.white70),
    borderRadius: BorderRadius.circular(16.r),
    color: ThemeClass.of(context).background,
  );

  void showEnhancedDialogFrame({required Widget widget}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      useRootNavigator: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          decoration: defaultDecoration(context),
          child: widget,
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss!();
    });
  }



  void successDialog() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          decoration: defaultDecoration(context),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss!();
    });
  }

  void deleteDialog({required Function() confirmDelete, Function()? cancel}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          decoration: defaultDecoration(context),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss!();
    });
  }

  void editDialog({required Function() confirmEdit, Function()? cancel}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          decoration: defaultDecoration(context),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss!();
    });
  }

  void errorDialog({Function()? onTapOk, Widget? actionWidget,}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          decoration: defaultDecoration(context),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss!();
    });
  }

  void errorDialogException({Function()? onTapErrorDetails,}) {
    if (_errorModel!.requestApi.method == "_") {
      errorDialog();
      return;
    }
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          decoration: defaultDecoration(context),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss!();
    });
  }
}

