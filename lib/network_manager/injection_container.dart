import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'rest_client.dart';

final dio = getDio();
final restClient = RestClient(baseUrl: "", dio);

Dio getDio() {
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    sendTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Dio dio = Dio(options);

  // dio interceptors

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (request, handler) {
        debugPrint("API Request BODY: ${request.data}");
        return handler.next(request);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        debugPrint("API Response: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        final response = e.response;
        debugPrint(
            "API Error --> statusCode: ${response?.statusCode} --> ${response?.statusMessage}: Error");
        return handler.next(e);
      },
    ),
  );
  return dio;
}
