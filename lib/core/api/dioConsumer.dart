import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/api/apiConsumer.dart';
import 'package:clinik_app/core/api/apiInterceptor.dart';
import 'package:clinik_app/core/errors/serverException.dart'
    show handleDioExceptions;
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = AppEndpoint.server;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
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

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool withToken = true,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(extra: {'sendToken': withToken}),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
    bool withToken = true,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(extra: {'sendToken': withToken}),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
    bool withToken = true,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(extra: {'sendToken': withToken}),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
    bool withToken = true,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(extra: {'sendToken': withToken}),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
