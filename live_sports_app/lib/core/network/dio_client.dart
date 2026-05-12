import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class DioClient {
  DioClient({Dio? dio, bool addDefaultInterceptors = true})
      : _dio = dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConstants.baseUrl,
              headers: const {'Accept': 'application/json'},
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
      if (kDebugMode) {
        _dio.interceptors.add(
          LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
          ),
        );
      }
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.next(options);
          },
        ),
      );
    }
  }

  final Dio _dio;

  Dio get instance => _dio;
}
