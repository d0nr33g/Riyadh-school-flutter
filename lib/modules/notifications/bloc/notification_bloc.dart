import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/notifications/model/notification_model.dart';
import 'package:riyad/modules/notifications/repository/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<GetNotificationEvent>(
          (event, emit) async {
        try {
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
