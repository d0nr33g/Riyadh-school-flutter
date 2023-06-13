import 'package:dio/dio.dart';
import 'package:riyad/core/api_path.dart';
import 'package:riyad/core/api_service.dart';
import 'package:riyad/core/app_shared.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/scan_auth/model/auth_model.dart';

class AuthRepository {
  static Future<GenericResponse<AuthModel>> loginUser(String qrCode) async {
    final Response?  response = await ApiService.postApi(
        ApiPaths.userLoginPath,
        body: <String, dynamic>{"token": qrCode},
        isAuth: false);
      return GenericResponse(fromJson: AuthModel.fromJson,json: response!.data,isList: false);

    // return UserResponse(
    //   json: response?.data,
    // );
  }
}