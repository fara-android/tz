import 'package:dio/dio.dart';
import 'catch_exceptions.dart';

class DioSettings {
  static const mainServer =
      "https://64ff55a0-fa3c-4bb4-a4b3-514d8c67eaa2.mock.pstmn.io/";
  Dio dio = Dio(
    BaseOptions(
      baseUrl: mainServer,
      connectTimeout: 20000,
      receiveTimeout: 20000,
    ),
  );
  initialSettings() {
    Interceptors interceptors = dio.interceptors;
    interceptors.requestLock.lock();
    interceptors.clear();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("response.data - ${response.data}");
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

      return handler.next(response);
    }, onError: (DioError e, handler) {
      print(
          'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
      CatchException.convertException(e);
      return handler.next(e);
    }));
    interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    interceptors.requestLock.unlock();
  }

  DioSettings() {
    initialSettings();
  }
}
