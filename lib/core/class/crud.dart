import 'dart:io';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/function/ckeckInternet.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Crud {
  late Dio dio;

  Crud() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
      ),
    );

    // Interceptor لإدارة الأخطاء والـ headers
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra["withToken"] == true) {
            final box = GetStorage();
            String? token = box.read('token');
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          options.headers['Accept'] = 'application/json';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.type == DioExceptionType.badResponse) {
            if (e.response?.statusCode == 401) {
              print("🔑 401 Unauthorized → ممكن تعمل Refresh Token أو Logout");
            }
          } else if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout) {
            print("⏱️ Timeout Error");
          } else if (e.type == DioExceptionType.unknown &&
              e.error is SocketException) {
            print("📴 لا يوجد إنترنت");
          }
          return handler.next(e);
        },
      ),
    );
  }
  Future<Either<Statusrequest, dynamic>> request(
    String method,
    String linkUrl, {
    Map? data,
    Map<String, dynamic>? queryParameters, // 🟢 أضفنا هذا
    bool withToken = false,
  }) async {
    try {
      if (await checkInternet()) {
        Response response;

        switch (method) {
          case "POST":
            response = await dio.post(
              linkUrl,
              data: data,
              options: Options(extra: {"withToken": withToken}),
            );
            break;
          case "PUT":
            response = await dio.put(
              linkUrl,
              data: data,
              options: Options(extra: {"withToken": withToken}),
            );
            break;
          case "DELETE":
            response = await dio.delete(
              linkUrl,
              options: Options(extra: {"withToken": withToken}),
            );
            break;
          default:
            response = await dio.get(
              linkUrl,
              queryParameters: queryParameters,
              options: Options(extra: {"withToken": withToken}),
            );
        }

        print("📥 Response Body: ${response.data}");
        return Right(response.data);
      } else {
        return Left(Statusrequest.offlinefailure);
      }
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Either<Statusrequest, dynamic>> postRequest(
    String linkUrl,
    Map data, {
    bool withToken = false,
  }) => request("POST", linkUrl, data: data, withToken: withToken);

  Future<Either<Statusrequest, dynamic>> getRequest(
    String linkUrl, {
    Map<String, dynamic>? queryParameters,
    bool withToken = false,
  }) => request(
    "GET",
    linkUrl,
    queryParameters: queryParameters,
    withToken: withToken,
  );

  Future<Either<Statusrequest, dynamic>> putRequest(
    String linkUrl,
    Map data, {
    bool withToken = false,
  }) => request("PUT", linkUrl, data: data, withToken: withToken);

  Future<Either<Statusrequest, dynamic>> deleteRequest(
    String linkUrl, {
    bool withToken = false,
  }) => request("DELETE", linkUrl, withToken: withToken);

  // 🔹 دالة موحدة لمعالجة أخطاء Dio
  Either<Statusrequest, dynamic> _handleDioError(DioException e) {
    print("❌ Dio Error: ${e.message}");

    if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        return Left(Statusrequest.failure);
      } else if (statusCode == 402) {
        return Left(Statusrequest.paymentRequired);
      } else if (statusCode == 403) {
        return Left(Statusrequest.failure);
      } else if (statusCode == 404) {
        return Left(Statusrequest.failure);
      } else if (statusCode == 500) {
        return Left(Statusrequest.serverfailure);
      } else {
        return Left(Statusrequest.serverfailure);
      }
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Left(Statusrequest.serverfailure);
    } else if (e.type == DioExceptionType.unknown &&
        e.error is SocketException) {
      return Left(Statusrequest.offlinefailure);
    }

    return Left(Statusrequest.serverException);
  }
}
