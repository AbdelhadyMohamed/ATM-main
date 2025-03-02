import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hypelify/Utilities/strings.dart';
import 'package:hypelify/Utilities/toast_helper.dart';
import 'package:hypelify/Widgets/custom_button_widget.dart';
import 'constants.dart';
import 'helper.dart';

class MapHelper {
  static Future<bool> checkGps() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ToastHelper.showError(message: Strings.locationDisabled.tr);
      return null;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ToastHelper.showError(message: Strings.locationDenied.tr);
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ToastHelper.showError(
          message: Strings.permissionDeniedCannotRequest.tr);
      return null;
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
  }

  static Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  static Future checkGpsWidget(
      {required BuildContext context, required Function() onDismiss}) async {
    Helper.showDialogWidget(
        onDismiss: onDismiss,
        context: context,
        child: SizedBox(
          height: 220.h,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                      onTap: () async {
                        context.pop();
                        // bool result = await MapHelper.checkGps();
                        // if (!result)
                        //   Modular.to.pop();
                      },
                      child: const Icon(Icons.close))
                ],
              ),
              space10Vertical,
              Text(
                Strings.cannotGetLocation.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              space20Vertical,
              Text(Strings.enableGps.tr),
              const Spacer(),
              // space10Horizontal,
              CustomButtonWidget.primary(
                title: Strings.openLocationSettings.tr,
                height: 40.h,
                onTap: () async {
                  Geolocator.openLocationSettings();
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          ),
        ));
  }
}
