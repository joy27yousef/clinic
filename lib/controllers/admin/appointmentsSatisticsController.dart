import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/data/models/admin/appointmentsModel.dart';

class AppointmentsStatisticsController extends GetxController { 

  late final AppRepository repo;
  final error = Rxn<ErrorModel>();
  Statusrequest statusrequest = Statusrequest.none;
  var appointmentStats = Rxn<AppointmentsStatsDataModel>();

  @override
  void onInit() {
    super.onInit();
    repo = AppRepository(api: DioConsumer(dio: Dio()));

    getAppointmentsStats();
  }

  List<String> titles = [
    'إجمالي عدد المواعيد',
    'المواعيد المجدولة',
    'المواعيد المكتملة',
    'المواعيد الملغية',
  ];

  double get completionRate {
    if (appointmentStats.value == null ||
        appointmentStats.value!.totalAppointments == 0)
      return 0.0;
    return appointmentStats.value!.completedAppointments /
        appointmentStats.value!.totalAppointments;
  }

  Future<void> getAppointmentsStats() async {
    statusrequest = Statusrequest.loading;
    update();

    final response = await repo.appointmentsStatsData();
    response.fold(
      (failure) {
        error.value = failure;
        statusrequest = Statusrequest.serverfailure;
        update();
      },
      (appointmentsStatsModel) {
        if (appointmentsStatsModel.status == true) {
          appointmentStats.value = appointmentsStatsModel.data;
          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }
}
