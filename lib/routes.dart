import 'package:clinik_app/core/constant/AppRoutes.dart';

import 'package:clinik_app/core/middleware/AppMiddleware.dart';
import 'package:clinik_app/views/screens/admin/adminBasePage.dart' show AdminBasePage;
import 'package:clinik_app/views/screens/admin/home/statisticsPages/appointmentsSatistics.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/doctorsStatistics.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/inputSatistics.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/patientStatistics.dart';
import 'package:clinik_app/views/screens/doctor/doctorBasePage.dart';
import 'package:clinik_app/views/screens/login/loginPage.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => LoginPage(), middlewares: [Mymiddleware()]),
  // //Auth
  GetPage(
    name: AppRoutes.login,
    page: () => LoginPage(),
    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.doctorBasePage,
    page: () => DoctorBasePage(),

    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  // doctors

  //admin
  GetPage(
    name: AppRoutes.adminBasePage,
    page: () => AdminBasePage(),
    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.doctorsStatistics,
    page: () => DoctorsStatistics(),
    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.patientStatistics,
    page: () => PatientStatistics(),
    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.inputSatistics,
    page: () => InputSatistics(),
    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.appointmentsSatistics,
    page: () => AppointmentsSatistics(),
    transition: Transition.rightToLeft, // الانتقال من اليمين لليسار
    transitionDuration: const Duration(milliseconds: 500),
  ),
  
];
