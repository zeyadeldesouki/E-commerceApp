// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://fakestoreapi.in/api';

  ApiService(this._dio);

  Future<Map<String, dynamic>> Get({required String endpoint}) async {
    var response = await _dio.get('$baseUrl/$endpoint');
    return response.data;
  }

  Future<Response> Post(
      {required String url,
      required body,
      required String token,
      Map<String,dynamic>? headers,
      String? contentType,}) async {
    var response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType:contentType ?? 'application/x-www-form-urlencoded',
        headers: headers ?? {
          "Authorization": "Bearer $token",
        },
      ),
    );
    return response;
  }
}
