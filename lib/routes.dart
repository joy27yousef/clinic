import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/patientStatistics.dart';
import 'package:clinik_app/core/middleware/AppMiddleware.dart';
import 'package:clinik_app/views/admin/adminBasePage.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/doctorsStatistics.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/inputSatistics.dart';
import 'package:clinik_app/views/doctor/doctorBasePage.dart';
import 'package:clinik_app/views/login/loginPage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => LoginPage(), middlewares: [Mymiddleware()]),
  // //Auth
  GetPage(name: AppRoutes.login, page: () => LoginPage()),
  GetPage(name: AppRoutes.doctorBasePage, page: () => DoctorBasePage()),
  // doctors

  //admin
  GetPage(name: AppRoutes.adminBasePage, page: () => AdminBasePage()),
  GetPage(name: AppRoutes.doctorsStatistics, page: () => DoctorsStatistics()),
  GetPage(name: AppRoutes.patientStatistics, page: () => PatientStatistics()),
  GetPage(name: AppRoutes.inputSatistics, page: () => InputSatistics()),
];
