import 'package:flutter/material.dart';

class DialogHelper {
  final Widget child;
  final BuildContext context;
  DialogHelper.dialog({required this.child,required this.context});

  void show(){
    showGeneralDialog(
      useRootNavigator: true,
      barrierLabel: "",
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: child,
        );
      },
    );
  }
}

