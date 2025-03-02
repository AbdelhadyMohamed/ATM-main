import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FireBaseOperations {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static bool isInit = false;
  static StreamSubscription? messageListenSubscription;

  static Future init() async {

    if (!isInit) {
      if (Platform.isIOS && !isInit) {
        messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      }
      await messageListenSubscription?.cancel();
      await messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint('>>>>> notification message <<<<<: ');
        debugPrint('Message data1: ${message.data}');
        HapticFeedback.heavyImpact();

        if (message.notification != null) {
          debugPrint(
              'Message also contained a notification title: ${message.notification!.title}');
          debugPrint(
              'Message also contained a notification body: ${message.notification!.body}');
        }
      });
      messageListenSubscription =
          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
            debugPrint('>>>>> notification message <<<<<: ');
            debugPrint('Message data2: ${message.data}');
            HapticFeedback.heavyImpact();
            }
          );
      isInit = true;
    }
  }



}

