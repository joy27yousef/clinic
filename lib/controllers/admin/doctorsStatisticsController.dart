import 'package:get/get.dart';
import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/data/remote/admin/doctors.dart';

class DoctorsStatisticsController extends GetxController {
  final DoctorsData doctorsData = DoctorsData(crud: Get.find<Crud>());
  Statusrequest statusrequest = Statusrequest.none;

  var selectedFilter = 0.obs;
  var doctorsList = <Map<String, dynamic>>[].obs;

  late int totalDoctors;
  late int availableDoctors;
  late int unavailableDoctors;
  late int specializationsCount;
  @override
  void onInit() {
    super.onInit();
    getDoctorsData();
  }

  final filters = ["الكل", "المتاحون", "غير المتاحين"];
  List title = [
    'إجمالي عدد الأطباء',
    'الأطباء المتاحون',
    'الأطباء غير المتاحين',
    'عدد الاختصاصات',
  ];
  List<Map<String, dynamic>> get filteredDoctors {
    if (selectedFilter.value == 1) {
      return doctorsList.where((d) => d["is_available"] == true).toList();
    } else if (selectedFilter.value == 2) {
      return doctorsList.where((d) => d["is_available"] == false).toList();
    }
    return doctorsList;
  }

  Future<void> getDoctorsData() async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await doctorsData.getData();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        update();
        print("❌ Server error");
      },
      (data) {
        if (data['status'] == true) {
          doctorsList.clear();
          doctorsList.addAll(
            List<Map<String, dynamic>>.from(data['data']['data']),
          );
          totalDoctors = doctorsList.length;
          availableDoctors = doctorsList
              .where((d) => d["is_available"] == true)
              .length;
          unavailableDoctors = doctorsList
              .where((d) => d["is_available"] == false)
              .length;
          specializationsCount = doctorsList
              .map((d) => d["specialization"])
              .toSet()
              .length;
          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
          print("⚠️ Error in response");
        }
        update();
      },
    );
  }

  void selectFilter(int index) {
    selectedFilter.value = index;
  }

  static find() {}
}
