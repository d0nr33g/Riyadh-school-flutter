import 'package:dio/dio.dart';
import 'package:riyad/core/api_path.dart';
import 'package:riyad/core/api_service.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/home/model/check_in_model.dart';
import 'package:riyad/modules/home/model/checkout_model.dart';

class HomeRepository {
  static Future<GenericResponse<ChickInModel>> checkin() async {
    final Response?  response = await ApiService.postApi(
        ApiPaths.checkInPath,
        isAuth: true);
      return GenericResponse(fromJson: ChickInModel.fromJson,json: response!.data,isList: false);
  }
    static Future<GenericResponse<ChickOutModel>> checkout() async {
    final Response?  response = await ApiService.postApi(
        ApiPaths.checkOutPath,
        isAuth: true);
      return GenericResponse(fromJson: ChickOutModel.fromJson,json: response!.data,isList: false);
  }
}