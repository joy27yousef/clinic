import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/data/remote/admin/appointments.dart';
import 'package:clinik_app/core/data/remote/doctor/appointments.dart';
import 'package:get/get.dart';
import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';

class InoutStatisticsController extends GetxController {
  final AppointmentsStatsData appointmentsData = AppointmentsStatsData(
    crud: Get.find<Crud>(),
  );
  Statusrequest statusrequest = Statusrequest.none;

  var appointmentStats = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getAppointmentsStatsData();
  }

  // أقل أجر استشارة
  double get minFee {
    if (dcontroller.doctorsList.isEmpty) return 0;
    return dcontroller.doctorsList
        .map((d) => double.tryParse(d['consultation_fee'] ?? '0') ?? 0)
        .reduce((a, b) => a < b ? a : b);
  }

  DoctorsStatisticsController dcontroller = Get.find();
  // أعلى أجر استشارة
  double get maxFee {
    if (dcontroller.doctorsList.isEmpty) return 0;
    return dcontroller.doctorsList
        .map((d) => double.tryParse(d['consultation_fee'] ?? '0') ?? 0)
        .reduce((a, b) => a > b ? a : b);
  }

  // متوسط أجر الاستشارة
  double get avgFee {
    if (dcontroller.doctorsList.isEmpty) return 0;
    final fees = dcontroller.doctorsList
        .map((d) => double.tryParse(d['consultation_fee'] ?? '0') ?? 0)
        .toList();
    return fees.reduce((a, b) => a + b) / fees.length;
  }

  List title = ['الصادرات', 'الواردات'];
  List title2 = ['متوسط أجر الاستشارة', 'أعلى أجر استشارة', 'أقل أجر استشارة'];
  double get completionRate {
    if (!appointmentStats.containsKey('total_appointments') ||
        appointmentStats['total_appointments'] == 0)
      return 0.0;
    return (appointmentStats['completed_appointments'] ?? 0) /
        appointmentStats['total_appointments'];
  }

  Future<void> getAppointmentsStatsData() async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await appointmentsData.getData();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        update();
        print("❌ Server error");
      },
      (data) {
        if (data['status'] == true) {
          appointmentStats.clear();
          appointmentStats.value = Map<String, dynamic>.from(data['data']);

          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
          print("⚠️ Error in response");
        }
        update();
      },
    );
  }
}
