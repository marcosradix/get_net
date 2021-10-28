import 'package:dio/dio.dart';

class GetnetInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //not needed to do login, all another request will receive the token stored
    if (options.path != "/auth/oauth/v2/token") {
      String accessToken = "eed952ba-9b89-4573-93ae-03ac457ef9e9";
      //To save sensitive data is not recommended to use shared preferences
      options.headers["Authorization"] = "Bearer $accessToken";
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    print("==================");
    print("GetnetConsumerDio");
    print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }
    print("<-- END HTTP");
    print("==================");

    return handler.next(response);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    print("==================");
    print("GetnetConsumerDio");
    print("<-- Error -->");
    print(err.error);
    print(err.response!.data);
    print(err.message);
    print("==================");
    return handler.next(err);
  }
}
