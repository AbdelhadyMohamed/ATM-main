// import 'package:flutter/material.dart';
// import 'package:upgrader/upgrader.dart';
// class UpdateAppScreen extends StatelessWidget {
//   final Widget child;
//   const UpdateAppScreen({Key?key, required this.child}):super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return UpgradeAlert(
//         upgrader: Upgrader(
//           platform: TargetPlatform.iOS,
//           dialogStyle: UpgradeDialogStyle.cupertino,
//           showLater: true,
//           showIgnore: false,
//           durationUntilAlertAgain: const Duration(days: 1),
//         ),
//         child: child );
//   }
// }