import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:riyad/core/firebase_cloud_messaging_service.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/notifications/model/notification_model.dart';
import 'package:riyad/modules/notifications/repository/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final FirebaseCloudMessagingService firebaseCloudMessagingService =
      FirebaseCloudMessagingService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationBloc() : super(NotificationInitial()) {
    on<GetNotificationEvent>(
      (event, emit) async {
        try {
          final NotificationSettings notificationsSettings =
          await firebaseCloudMessagingService.requestPermission();
          AndroidNotificationChannel channel =
          AndroidNotificationChannel(
            'high_importance_channel',
            'High Importance Notifications',
            description: 'This channel is used for important notifications.',
            importance: Importance.max,
          );

          await FlutterLocalNotificationsPlugin()
              .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
              ?.createNotificationChannel(channel);
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
          emit(NotificationLoading());
          final GenericResponse<NotificationModel> response =
              await NotificationRepository.getNotification();
          if (response.success) {
            emit(NotificationLoaded(notificationModel: response.results!));
          }
        } catch (e) {
          emit(NotificationFailed(errorMessage: e.toString()));
        }
      },
    );
  }
}
