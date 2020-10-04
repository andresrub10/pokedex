import 'package:dio/dio.dart';

class HttpClient {
  static String BASE_URL = "https://pokeapi.co/api/v2";
  static HttpClient _instance;
  Dio _dio;

  static HttpClient getInstance() {
    if (_instance == null) {
      _instance = new HttpClient();
      _instance._dio = new Dio();
    }
    return _instance;
  }

  dynamic get(String url, Map<String, dynamic> parameters) async {
    Response response =
        await _dio.get(BASE_URL + url, queryParameters: parameters);
    return response;
  }
}
