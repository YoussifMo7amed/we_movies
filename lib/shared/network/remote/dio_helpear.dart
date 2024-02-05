import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en-US',
      String? Token,
      int? page,
      }) async {
    dio!.options.headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDgwMzBmMThlYmVhNWEzY2Y0MmM5NGNmOTAxN2ZjZiIsInN1YiI6IjY1YjU1YTYxYWZlMjI0MDE2MzM4ZGIyMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-bnQR_8u9vUj3GgemWYj-qUAttYtlO99UispuLJe1v0"
    };
    return await dio!.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? Token}) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': Token ?? '',
      'Content-Type': 'application/json'
    };
    {}
    return await dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? Token}) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': Token ?? '',
      'Content-Type': 'application/json'
    };
    {}
    return await dio!.put(url, queryParameters: query, data: data);
  }
}
