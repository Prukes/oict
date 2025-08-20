import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInstance {
  // Private constructor
  DioInstance._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.golemio.cz',
      connectTimeout: const Duration(seconds: 15),
      headers: {
        'x-access-token': dotenv.get('API_KEY'),
      },
    ),
  );

  static Dio get instance => _dio;
}
