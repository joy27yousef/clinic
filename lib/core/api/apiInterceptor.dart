import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/cache/cacheHelper.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sendToken = options.extra['sendToken'] ?? true; 

    if (sendToken) {
      final token = CacheHelper().getData(key: GeneralKey.token);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    super.onRequest(options, handler);
  }
}
