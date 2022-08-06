import 'package:dio/dio.dart';

import '../../data/core/constants/api_constants.dart';


abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio();
    dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = ApiConstants.connectionTimeOut
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          requestHeader: true,
          requestBody: true));

    return dio;
  }
}
