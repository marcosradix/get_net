import 'package:dio/dio.dart';
import 'constants.dart';
import 'getnet_interceptor.dart';

class CustomDioGetnet {
  Dio dio = Dio();
  CustomDioGetnet() {
    dio.options = BaseOptions(
        connectTimeout: 300000,
        receiveTimeout: 300000,
        baseUrl: myUrlGetnetApi);
    dio.interceptors.add(GetnetInterceptor());
  }
}
