import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    String? token = box.read('token');
    String? role = box.read('role');

    if (token != null && token.isNotEmpty) {
      return role == 'admin'
          ? RouteSettings(name: AppRoutes.adminBasePage)
          : RouteSettings(name: AppRoutes.doctorBasePage);
    } else {
      return RouteSettings(name: AppRoutes.login);
    }
  }
}
