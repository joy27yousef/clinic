import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/data/models/admin/reports/appointmentsRevenue.dart';
import 'package:clinik_app/core/data/models/admin/reports/comprehensiveReport.dart';
import 'package:clinik_app/core/data/models/admin/reports/monthluReports.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ReportsController extends GetxController {
  late final AppRepository repo;
  final error = Rxn<ErrorModel>();

  Statusrequest statusrequest = Statusrequest.none;


  Rxn<AppointmentReportModel> reportAppointmentData =
      Rxn<AppointmentReportModel>();
  Rxn<ComprehensiveReportModel> comprehensiveReportData =
      Rxn<ComprehensiveReportModel>();
  Rxn<MonthlyProfitReportModel> monthlyProfitReportData =
      Rxn<MonthlyProfitReportModel>();

  Rxn<ComprehensiveReportModel> get reportFinancialData =>
      comprehensiveReportData;

  @override
  void onInit() {
    super.onInit();
    repo = AppRepository(api: DioConsumer(dio: Dio()));
    getAppointmentsRevenue();
    getcomprehensiveReport();
    getMonthlyProfitReport();
  }

  Future<void> getAppointmentsRevenue({Map<String, dynamic>? params}) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await repo.appointmentReportData(params: params);

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        error.value = failure;
        update();
      },
      (data) {
        if (data.status == true) {
          statusrequest = Statusrequest.success;
          reportAppointmentData.value = data;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }

  Future<void> getcomprehensiveReport({Map<String, dynamic>? params}) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await repo.comprehensiveReportData(params: params);

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        error.value = failure;
        update();
      },
      (data) {
        if (data.status == true) {
          statusrequest = Statusrequest.success;
          comprehensiveReportData.value = data;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }

  Future<void> getMonthlyProfitReport({Map<String, dynamic>? params}) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await repo.monthlyProfitReportData(params: params);

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        error.value = failure;
        update();
      },
      (data) {
        if (data.status == true) {
          statusrequest = Statusrequest.success;
          monthlyProfitReportData.value = data;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }
}
