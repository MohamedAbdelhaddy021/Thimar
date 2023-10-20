import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'helper_methods.dart';

class DioHelper {
  final _dio = Dio(BaseOptions(
    baseUrl: "https://thimar.amr.aait-d.com/api/",
  ));

  Future<CustomResponse?> sendData(String endPoint,
      {Map<String, dynamic>? data}) async {
    try {
      var response = await _dio.post(endPoint, data: data);
      print(response.data["message"]);
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(ex.response?.data["message"])));
      return CustomResponse(
        message: ex.response?.data["message"],
        isSuccess: false,
        response: ex.response,
      );
    }
  }

  Future<CustomResponse?> getData(String endPoint,
      {Map<String, dynamic>? data}) async {
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
