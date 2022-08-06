import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'api_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  //Get: -----------------------------------------------------------------------
  dynamic get(
      String path, {
        Map<dynamic, dynamic>? params,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.get(
        getPath(path, params),
        options: Options(
          headers: {'Content-Type': 'Application/json'},
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return debugPrint('Error get Api: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.baseUrl}$path?api_key=${ApiConstants.apiKey}$paramsString';
  }
}
