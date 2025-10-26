import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/data/models/admin/doctorListModel.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:clinik_app/core/class/statusRequest.dart';

class DoctorsStatisticsController extends GetxController {
  late final AppRepository repo;
  final error = Rxn<ErrorModel>();
  var doctorsList = <DoctorModel>[].obs;
  Statusrequest statusrequest = Statusrequest.none;

  var selectedFilter = 0.obs;

  int totalDoctors = 0;
  int availableDoctors = 0;
  int unavailableDoctors = 0;
  int specializationsCount = 0;

  final filters = ["الكل", "المتاحون", "غير المتاحين"];
  List<String> title = [
    'إجمالي عدد الأطباء',
    'الأطباء المتاحون',
    'الأطباء غير المتاحين',
    'عدد الاختصاصات',
  ];

  @override
  void onInit() {
    super.onInit();
    repo = AppRepository(api: DioConsumer(dio: Dio()));

    getDoctors();
  }
  List<DoctorModel> get filteredDoctors {
    if (selectedFilter.value == 1) {
      return doctorsList.where((d) => d.isAvailable == true).toList();
    } else if (selectedFilter.value == 2) {
      return doctorsList.where((d) => d.isAvailable == false).toList();
    }
    return doctorsList;
  }

  Future<void> getDoctors() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await repo.doctorListdata();
    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        error.value = failure;
        update();
      },
      (doctorListModel) {
        if (doctorListModel.status) {
          doctorsList.value = doctorListModel.data?.doctors ?? [];
          totalDoctors = doctorsList.length;
          availableDoctors = doctorsList
              .where((d) => d.isAvailable == true)
              .length;
          unavailableDoctors = doctorsList
              .where((d) => d.isAvailable == false)
              .length;
          specializationsCount = doctorsList
              .map((d) => d.specialization)
              .toSet()
              .length;

          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }

  /// تغيير الفلتر
  void selectFilter(int index) {
    selectedFilter.value = index;
  }
}
