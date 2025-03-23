

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, linux: initializationSettingsLinux);

    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
          if (notificationResponse.payload != null) {
            // Navigate based on payload data
          }
        });
  }

  Future<dynamic> onSelectMessage(payload) async {}

  static void display(RemoteMessage message,{bool isHighImportant = true}) async {
    try {
      NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "Wazzifni",
        "Wazzifni channel",
        channelDescription: "Wazzifni app channel",
        importance: isHighImportant ? Importance.max : Importance.min,
        priority: isHighImportant ?  Priority.high : Priority.low,
        ongoing:true,
        playSound: true,
        enableVibration: true,
      ));

      await _notificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch.remainder(100000),
        message.notification?.title ?? "",
        message.notification?.body ?? "",
        notificationDetails,
        //payload: message.data.toString()
      );
    } catch (e) {}
  }

  static void disDisplay(){
    _notificationsPlugin.cancelAll();
  }


}
