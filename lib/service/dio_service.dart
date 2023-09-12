import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class DioService {
  Dio? _instance;
  Dio instance() {
    _instance ??= createDioInstance();
    return _instance!;
  }

  Dio createDioInstance() {
    Dio dio = Dio();
    dio.interceptors.add(ChuckerDioInterceptor());
    return dio;
  }
}
