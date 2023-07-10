part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {
  NotificationLoading();
}

class NotificationLoaded extends NotificationState {
 List<NotificationModel> notificationModel;
  NotificationLoaded({required this.notificationModel});
}

class NotificationFailed extends NotificationState {
  String errorMessage;
  NotificationFailed({required this.errorMessage});
}
