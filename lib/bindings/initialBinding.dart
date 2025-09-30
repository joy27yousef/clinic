import 'package:clinik_app/controllers/admin/adminBaseController.dart';
import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/controllers/auth/loginController.dart';
import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/controllers/doctor/doctorBaseController.dart';
import 'package:clinik_app/controllers/auth/logoutController.dart';
import 'package:clinik_app/core/class/crud.dart';
import 'package:get/get.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(DoctorBaseController());
    Get.put(LoginController());
    Get.put(LogoutController());
    Get.put(CalendarControllerX());
    Get.put(AdminBaseController());
    Get.put(DoctorsStatisticsController());
    // Get.lazyPut<CalendarControllerX>(() => CalendarControllerX());
  }
}
