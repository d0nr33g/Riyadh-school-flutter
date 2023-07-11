import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riyad/modules/notifications/screens/notification_screen.dart';

class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  late AndroidInitializationSettings androidInitializationSettings;
  late DarwinInitializationSettings darwinInitializationSettings;
  late InitializationSettings initializationSettings;
  BuildContext context;

  LocalNotificationService({required this.context});

  Future<void> initialize() async {
    androidInitializationSettings = AndroidInitializationSettings('ic_launcher');
    darwinInitializationSettings=DarwinInitializationSettings();
    initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      print(payload);
    }

    // Navigate to another screen
   Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationScreen()));
  }

  Future<void> showNotification({required String title, required String body}) async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'Channel ID',
      'Channel title',
      importance: Importance.high,
      priority: Priority.high,
      fullScreenIntent: true,
      ticker: 'test',
    );
    DarwinNotificationDetails darwinNotificationDetails=const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
}


