import 'package:clinik_app/core/data/remote/admin/appointments.dart';
import 'package:clinik_app/core/data/remote/doctor/appointments.dart';
import 'package:get/get.dart';
import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';

class AppointmentsSatisticsController extends GetxController {
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

  List title = [
    'إجمالي عدد المواعيد',
    'المواعيد المجدولة',
    'المواعيد المكتملة',
    'المواعيد الملغية',
  ];
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
