import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://pub.dev/",
          ),
        );
  Future<Response> getRequest(String path, [bool isAuth = false]) async {
    if (isAuth) {
      return dio.get(path, options: Options(headers: {"Authorization": ""}));
    } else {
      return dio.get(path);
    }
  }
}
