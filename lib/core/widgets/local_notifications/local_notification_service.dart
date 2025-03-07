

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;


class LocalNotificationService {

  static final LocalNotificationService _notificationService =
  LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _notificationService;
  }

  LocalNotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('splash');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future selectNotification(String payload) async {}

  Future<void> showNotification(
      {required String title,
        bool enableVibration = false,
        bool playSound = false,
        bool showProgress = false,
        bool onlyAlertOnce = false,
        int progress = 0,
        bool ongoing = false,
        int maxProgress = 100, String body = '',
        int notificationId = 0,
      }) async {
    if(showProgress && Platform.isIOS) return;
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channel ID',
      'channel name',
      channelDescription: 'channel description',
      enableVibration: enableVibration,
      showProgress: showProgress,
      ongoing: ongoing,
      onlyAlertOnce: onlyAlertOnce,
      progress: progress,
      maxProgress: maxProgress,
      playSound: playSound,
      priority: Priority.high,
      importance: Importance.high,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
    );



    await flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Notification Payload',
    );
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

}
