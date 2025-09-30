import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/widgets/doctorTable.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/widgets/statisticsDoctorCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsStatistics extends StatelessWidget {
  DoctorsStatistics({super.key});
  final DoctorsStatisticsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأطباء في النظام'),
        leadingWidth: 40,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          if (controller.statusrequest == Statusrequest.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.statusrequest == Statusrequest.serverfailure) {
            return const Center(child: Text("خطأ في الخادم"));
          } else if (controller.statusrequest == Statusrequest.failure) {
            return const Center(child: Text("لا توجد بيانات"));
          }

          return ListView(children: [StatisticsDoctorCard(), DoctorTable()]);
        }),
      ),
    );
  }
}
