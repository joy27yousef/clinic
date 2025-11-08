import 'package:clinik_app/controllers/admin/adminBaseController.dart';
import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/controllers/admin/patientStatisticsController.dart';
import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/controllers/changePassController.dart';
import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/controllers/doctor/doctorBaseController.dart';

import 'package:get/get.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ChangePassController());
    //admin
    Get.lazyPut(() => AdminBaseController(), fenix: true);
    Get.lazyPut(() => DoctorsStatisticsController(), fenix: true);
    Get.lazyPut(() => PatientStatisticsController(), fenix: true);
    Get.lazyPut(() => AppointmentsStatisticsController(), fenix: true);
    Get.lazyPut(() => ReportsController(), fenix: true);

    //doctor
    Get.lazyPut(() => DoctorBaseController(), fenix: true);
    Get.lazyPut(() => CalendarControllerX(), fenix: true);
  }
}
