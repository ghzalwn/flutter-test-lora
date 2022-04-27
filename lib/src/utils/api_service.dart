import 'package:dio/dio.dart';

class ApiService {
  Dio callApi() {
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.polygon.io/v3/',
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    );
    return _dio;
  }
}
