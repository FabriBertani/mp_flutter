import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RestService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.mercadopago.com/';

  Future<dynamic> get({
    required String path,
    required String accessToken,
    Map<String, dynamic> data = const{}
  }) async {
    _dio.options.headers["Authorization"] = "Bearer $accessToken";
    _dio.options.headers['content-Type'] = 'application/json';

    final result = await _dio.get(_baseUrl + path);

    return result.data;
  }

  Future<dynamic> post({
    required String path,
    required String accessToken,
    Map<String, dynamic> data = const {}
  }) async {
    _dio.options.headers["Authorization"] = "Bearer $accessToken";
    _dio.options.headers['content-Type'] = 'application/json';

    try {
      final result = await _dio.post(_baseUrl + path, data: data);

      return result.data;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response!.data);
      }

      throw e.message;
    }
  }
}