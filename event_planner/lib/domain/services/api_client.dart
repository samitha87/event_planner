import 'package:dio/dio.dart';
import 'package:event_planner/common/Urls.dart';

class ApiClient {
  ApiClient._();

  // final _localPrefs = LocalPreferences.instance;
  static final ApiClient _instance = ApiClient._();

  factory ApiClient() {
    return _instance;
  }

  Dio get dio {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 5000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      ),
    );

    return dio;
  }

  Dio get dioForm {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 5000),
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': '*/*',
        },
      ),
    );

    return dio;
  }

  Dio get authDio {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 5000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      ),
    );

    return dio;
  }
}
