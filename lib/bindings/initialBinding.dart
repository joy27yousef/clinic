import 'package:clinik_app/controllers/admin/adminBaseController.dart';
import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/controllers/admin/inoutStatisticsController.dart';
import 'package:clinik_app/controllers/admin/patientStatisticsController.dart';
import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/controllers/doctor/doctorBaseController.dart';

import 'package:clinik_app/core/class/crud.dart';
import 'package:get/get.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(DoctorBaseController());
    Get.put(AuthController());
    Get.put(CalendarControllerX());
    Get.put(AdminBaseController());
    Get.put(DoctorsStatisticsController());
    Get.put(PatientStatisticsController());
    Get.put(AppointmentsSatisticsController());
    Get.put(InoutStatisticsController());
    // Get.lazyPut<CalendarControllerX>(() => CalendarControllerX());
  }
}
