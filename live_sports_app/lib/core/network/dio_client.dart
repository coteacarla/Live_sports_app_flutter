import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class DioClient {
  DioClient({Dio? dio, bool addDefaultInterceptors = true})
      : _dio = dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConstants.baseUrl,
              connectTimeout:
                  const Duration(seconds: ApiConstants.requestTimeoutSeconds),
              receiveTimeout:
                  const Duration(seconds: ApiConstants.requestTimeoutSeconds),
              sendTimeout:
                  const Duration(seconds: ApiConstants.requestTimeoutSeconds),
              responseType: ResponseType.json,
            ),
          ) {
    if (addDefaultInterceptors) {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers.putIfAbsent('Accept', () => 'application/json');
            handler.next(options);
          },
        ),
      );
    }
  }

  final Dio _dio;

  Dio get instance => _dio;
}
