import 'package:dio/dio.dart';
import 'package:riyad/core/api_path.dart';
import 'package:riyad/core/api_service.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/attendance/model/attendance_model.dart';
import 'package:riyad/modules/attendance/model/day_attend_model.dart';


class AuttendaceRepository {
  static Future<GenericResponse<AttendanceModel>> getWeekAttendance() async {
    final Response?  response = await ApiService.getApi(
        ApiPaths.weeklyAttendacePath,
        isAuth: true);
      return GenericResponse(fromJson: AttendanceModel.fromJson,json: response!.data,isList: true);
  }
    static Future<GenericResponse<DayAttendaceModel>> getdayAttendance() async {
    final Response?  response = await ApiService.getApi(
        ApiPaths.dayAttendanceacePath,
        isAuth: true);
      return GenericResponse(fromJson: DayAttendaceModel.fromJson,json: response!.data,isList: false);
  }
}