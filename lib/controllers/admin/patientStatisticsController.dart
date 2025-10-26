import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/data/models/admin/recordModel.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PatientStatisticsController extends GetxController {
  late final AppRepository repo;
  final error = Rxn<ErrorModel>();

  Statusrequest statusrequest = Statusrequest.none;

  var patientsList = RxnInt(); // إجمالي عدد المرضى
  var recordsData = Rxn<MedicalRecordsStatsDataModel>(); // بيانات الإحصائيات

  List<String> title = [
    'إجمالي عدد المرضى',
    'عدد السجلات  الحاوية علاج',
    'عدد السجلات  الحاوية وصفات',
    'عدد السجلات  الحاوية تشخيص',
  ];

  @override
  void onInit() {
    super.onInit();
    repo = AppRepository(api: DioConsumer(dio: Dio()));
    getPatientsData();
    getRecordsData();
  }

  Future<void> getPatientsData() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await repo.patientListData();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        error.value = failure;
        update();
      },
      (patientListModel) {
        if (patientListModel.status == true) {
          patientsList.value = patientListModel.data!.total ?? 0;
          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }

  Future<void> getRecordsData() async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await repo.recordData();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        error.value = failure;
        update();
      },
      (medicalRecordsStatsModel) {
        if (medicalRecordsStatsModel.status == true) {
          recordsData.value = medicalRecordsStatsModel.data;
          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }
}
