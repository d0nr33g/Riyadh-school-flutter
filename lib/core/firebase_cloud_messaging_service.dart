import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudMessagingService {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future<RemoteMessage?> get getInitialMessage => firebaseMessaging.getInitialMessage();

  Future<NotificationSettings> requestPermission() => firebaseMessaging.requestPermission();

  StreamSubscription<RemoteMessage> listenToForegroundNotifications(
      void Function(RemoteMessage) callback,
      ) {
    return FirebaseMessaging.onMessage.listen(callback);
  }

  StreamSubscription<RemoteMessage> listenToBackgroundNotifications(
      void Function(RemoteMessage) callback,
      ) {
    return FirebaseMessaging.onMessageOpenedApp.listen(callback);
  }

  Future<String?> getFcmToken() async => firebaseMessaging.getToken();

}