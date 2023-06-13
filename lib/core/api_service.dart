import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riyad/core/app_config.dart';
import 'package:riyad/core/app_shared.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static const String urlEncodedType = 'multipart/form-data';
  static const String jsonType = 'application/json';
  static const int unAuthorizedCode = 403;
  static const int internalServerErrorCode = 500;
  static const String authorizationParameter = 'Authorization';
  static const String bearer = 'Bearer';

  static Future<Response<T>?> getApi<T>(String path,
      {bool isAuth = true}) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      await AppShared.getToken();
      final String token = AppShared.token;
      dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    // if (hasLanguage) {
    //   path += '/${AppShared.language()}';
    // }

    final Response<T> response = await dio.get(
      path,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return status < internalServerErrorCode;
          return false;
        },
      ),
    );

    // //check the status
    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return getApi(path, isAuth: isAuth);
    //   return null;
    // } else {
    //   return response;
    // }
    return response;
  }

  static Future<Response<T>?> getApiwithQuery<T>(
      String path, Map<String, dynamic>? quary,
      {bool isAuth = true}) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      await AppShared.getToken();
      final String token = AppShared.token;
      dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    // if (hasLanguage) {
    //   path += '/${AppShared.language()}';
    // }

    final Response<T> response = await dio.get(
      path,
      queryParameters: quary,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return status < internalServerErrorCode;
          return false;
        },
      ),
    );

    // //check the status
    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return getApi(path, isAuth: isAuth);
    //   return null;
    // } else {
    //   return response;
    // }
    return response;
  }

  static Future<Response<T>?> getApiSearch<T>(
      String path,
      BuildContext context,
      List<String> university,
      List<String> college,
      List<String> specialization,
      List<String> subject,
      {bool isAuth = true}) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      //token = AppShared.token.accessToken;
      // await AppShared.getToken();
      // final String token = AppShared.token;
      //  dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    // if (hasLanguage) {
    //   path += '/${AppShared.language()}';
    // }
    final Map<String, List<String>> queryParameters = {
      'university[]': university,
      'college[]': college,
      'specialization[]': specialization,
      'subject[]': subject,
    };
    Localizations.localeOf(context).languageCode == 'en'
        ? dio.options.headers['Accept-Language'] = 'en'
        : dio.options.headers['Accept-Language'] = 'ar';

    final Response<T> response = await dio.get(path, options: Options(
      validateStatus: (int? status) {
        if (status != null) return status < internalServerErrorCode;
        return false;
      },
    ), queryParameters: queryParameters);
    return null;

    // //check the status
    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return getApi(path, isAuth: isAuth);
    //   return null;
    // } else {
    //   return response;
    // }
  }

  static Future<Response<T>?> postApi<T>(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
    bool isJson = true,
    bool isAuth = false,
  }) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      await AppShared.getToken();
      final String token = AppShared.token;
      dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    final Response<T> response = await dio.post(
      path,
      data: body,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) {
            return status < internalServerErrorCode;
          }
          return false;
        },
        contentType: isJson ? jsonType : urlEncodedType,
      ),
    );
    // return response;
    //check the status

    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return postApi(path, body: body, isAuth: isAuth, isJson: isJson);
    //   return null;
    // } else {
    //   return response;
    // }
    return response;
  }

  static Future<Response<T>?> postApiMultiFile<T>(
    String path, {
    required FormData body,
    bool isJson = true,
    bool isAuth = false,
  }) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      await AppShared.getToken();
      final String token = AppShared.token;
      dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    final Response<T> response = await dio.post(
      path,
      data: body,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) {
            return status < internalServerErrorCode;
          }
          return false;
        },
        contentType: isJson ? jsonType : urlEncodedType,
      ),
    );
    return response;
  }
  // static Future<String?> refreshToken() async {
  //   final Response<dynamic>? response = await postApi(
  //     ApiPaths.refreshTokens,
  //     isAuth: false,
  //     body: <String, dynamic>{
  //       "refreshToken": AppShared.refreshToken,
  //     },
  //   );
  //   if (response != null) {
  //     if (response.statusCode != 200) {
  //       return null;
  //     } else {
  //       AppShared.setToken(response.data['data']['token']);
  //       print("Token : ${response.data['data']['token']}");
  //       return response.data['data']['token'];
  //     }
  //   }
  //   return null;
  // }

  static Future<Response<T>?> deleteApi<T>(String path,
      {bool isAuth = true}) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      await AppShared.getToken();
      final String token = AppShared.token;
      dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    // if (hasLanguage) {
    //   path += '/${AppShared.language()}';
    // }

    final Response<T> response = await dio.delete(
      path,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return status < internalServerErrorCode;
          return false;
        },
      ),
    );

    // //check the status
    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return getApi(path, isAuth: isAuth);
    //   return null;
    // } else {
    //   return response;
    // }
    return response;
  }

  static Future<Response<T>?> patchApi<T>(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
    bool isJson = true,
    bool isAuth = false,
  }) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    String token;
    if (isAuth) {
      // await AppShared.getToken();
      // token = AppShared.token;
      // dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    final Response<T> response = await dio.patch(
      path,
      data: body,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return status < internalServerErrorCode;
          return false;
        },
        contentType: isJson ? jsonType : urlEncodedType,
      ),
    );
    return null;

    // return response;
    //check the status
    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return postApi(path, body: body, isAuth: isAuth, isJson: isJson);
    //   return null;
    // } else {
    //   return response;
    // }
  }

  static Future<Response<T>?> postMultiPartAndFileApi<T>(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
    required List<String?> filesName,
    List<File>? files,
    bool isJson = true,
    bool isAuth = false,
  }) async {
    // dio init

    final FormData formData = FormData();
    body.forEach((String key, dynamic value) {
      if (value is List) {
        value.forEach((e) {
          formData.fields.add(MapEntry(key, e.toString()));
        });
      } else {
        formData.fields.add(
          MapEntry<String, String>(key, value.toString()),
        );
      }
    });

    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    String token;
    if (isAuth) {
      // await CacheHelper.refreshAccessToken();
      // token = CacheHelper.accessToken;
      // dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    if (files != null && files.isNotEmpty) {
      for (int i = 0; i < files.length; i++) {
        final String fileName = files[i].path.split('/').last;
        formData.files.add(
          MapEntry<String, MultipartFile>(
            filesName[i] ?? fileName,
            MultipartFile.fromFileSync(files[i].path,
                filename: filesName[i] ?? fileName),
          ),
        );
      }
    }
    final Response<T> response = await dio.post(
      path,
      data: formData,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return status < internalServerErrorCode;
          return false;
        },
        contentType: isJson ? jsonType : urlEncodedType,
      ),
    );

    return response;
  }

  static Future<Response<T>?> putApi<T>(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
    bool isJson = true,
    bool isAuth = false,
  }) async {
    // dio init
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    //call api
    if (isAuth) {
      await AppShared.getToken();
      final String token = AppShared.token;
      dio.options.headers[authorizationParameter] = '$bearer $token';
    }

    final Response<T> response = await dio.put(
      path,
      data: body,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) {
            return status < internalServerErrorCode;
          }
          return false;
        },
        contentType: isJson ? jsonType : urlEncodedType,
      ),
    );
    // return response;
    //check the status

    // if (response.statusCode == unAuthorizedCode) {
    //   await refreshToken();
    //   // return postApi(path, body: body, isAuth: isAuth, isJson: isJson);
    //   return null;
    // } else {
    //   return response;
    // }
    return response;
  }
}
