import 'package:clinik_app/controllers/admin/adminBaseController.dart';
import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/controllers/admin/patientStatisticsController.dart';
import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/controllers/doctor/doctorBaseController.dart';
import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/cache/cacheHelper.dart';
import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? token = CacheHelper().getDataString(key: GeneralKey.token);
    String? role = CacheHelper().getDataString(key: GeneralKey.userRole);

    if (token != null && token.isNotEmpty) {
      if (role == 'admin') {
        return RouteSettings(name: AppRoutes.adminBasePage);
      } else if (role == 'doctor') {
        return RouteSettings(name: AppRoutes.doctorBasePage);
      }
    } else {
      return RouteSettings(name: AppRoutes.login);
    }
  }
}
