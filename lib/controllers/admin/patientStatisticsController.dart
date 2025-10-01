import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/data/remote/admin/patients.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PatientStatisticsController extends GetxController {
  final PatientsData patientsData = PatientsData(crud: Get.find<Crud>());
  final RecordsData recordsData = RecordsData(crud: Get.find<Crud>());

  Statusrequest statusrequest = Statusrequest.none;

  var patientsList = <Map<String, dynamic>>[];
  var recordsList = <Map<String, dynamic>>[];

  List<String> title = [
    'إجمالي عدد المرضى',
    'عدد السجلات  الحاوية علاج',
    'عدد السجلات  الحاوية وصفات',
    'عدد السجلات  الحاوية تشخيص',
  ];

  late int totalPatient = 0;

  @override
  void onInit() {
    super.onInit();
    getPatientsData();
    getRecordsData();
  }

  Future<void> getPatientsData() async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await patientsData.getData();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        update();
      },
      (data) {
        if (data['status'] == true) {
          patientsList.clear();
          patientsList.addAll(
            List<Map<String, dynamic>>.from(data['data']['data']),
          );
          totalPatient = patientsList.length;
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

    var response = await recordsData.getData();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        update();
      },
      (data) {
        if (data['status'] == true) {
          recordsList.clear();

          // ✅ نحول الـ Map إلى عنصر واحد داخل List
          recordsList.add(Map<String, dynamic>.from(data['data']));

          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }
}
