import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> post<T>(String path, {Object? data}) async {
    try {
      final response = await _dio.post<T>(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Add more methods for PUT, DELETE, etc. as needed
}
