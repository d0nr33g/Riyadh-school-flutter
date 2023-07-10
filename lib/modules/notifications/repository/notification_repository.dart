import 'package:dio/dio.dart';
import 'package:riyad/core/api_path.dart';
import 'package:riyad/core/api_service.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/notifications/model/notification_model.dart';

class NotificationRepository {
  static Future<GenericResponse<NotificationModel>> getNotification() async {
    final Response? response = await ApiService.getApi(
        ApiPaths.notificationPath,
        isAuth: true);
    return GenericResponse(
        fromJson: NotificationModel.fromJson, json: response!.data, isList: true);
  }
}