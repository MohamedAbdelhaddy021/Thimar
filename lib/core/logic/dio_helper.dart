import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thimar/core/logic/cache_helper.dart';

import 'helper_methods.dart';

class DioHelper {
  final _dio = Dio(BaseOptions(
    baseUrl: "https://thimar.amr.aait-d.com/api/",
  ));

  Future<CustomResponse?> sendData(String endPoint,
      {Map<String, dynamic>? data}) async {
    _dio.options.headers = {
      "Authorization" :"Bearer ${CacheHelper.getUserToken()}"
    };
    print("(Post) https://thimar.amr.aait-d.com/api/$endPoint");
    print("Data $data");
    print("Header ${_dio.options.headers}");

    try {
      var response = await _dio.post(endPoint, data: data);
      print(response.data["message"]);
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      print(ex.response?.data);
      String msg;
      try {
        msg = ex.response?.data["message"];

        }catch (ex)
        {
          msg = "something wrong";
        }

        ScaffoldMessenger.of(navigatorKey.currentContext!)
            .showSnackBar(SnackBar(content: Text(msg))
    );

    return CustomResponse(
    message: ex.response?.data["message"],
    isSuccess: false,
    response: ex.response,
    );
    }
  }

  Future<CustomResponse?> getData(String endPoint,
      {Map<String, dynamic>? data}) async {
    _dio.options.headers = {
      "Authorization" :"Bearer ${CacheHelper.getUserToken()}"
    };
    print("(Get) https://thimar.amr.aait-d.com/api/$endPoint");
    print("Data ${data}");
    print("Header ${_dio.options.headers}");
    try {
      final response = await _dio.get(endPoint, queryParameters: data);
      print(response.data);
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      print(ex.response!.data["message"]);
    }
    return null;
  }

  Future<CustomResponse?> updateData(String endPoint,
      {Map<String, dynamic>? data, bool haveToken = false}) async {
    try {
      final response = await _dio.put(endPoint,
          data: data,
          options: Options(
              headers: haveToken
                  ? {
                "Authorization":
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjUxOTk3NjY5LCJleHAiOjE2ODM1MzM2NjksIm5iZiI6MTY1MTk5NzY2OSwianRpIjoiT3psNnoxS29STG43SUlDZiIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.RknnxKEnLWIlQlbycuh6Yx3kRMX3oYPvYyA2T6WxjTo`"
              }
                  : null));
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(ex.response?.data["message"])));
    }
  }
}

class CustomResponse {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  CustomResponse({
    required this.message,
    required this.isSuccess,
    required this.response,
  });
}
