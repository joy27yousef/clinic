import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/widgets/doctorTable.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/widgets/statisticsDoctorCard.dart';
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
      body: RefreshIndicator(
        color: Appcolor.bas2,
        onRefresh: () async {
          await controller.getDoctors();
        },
        child: GetBuilder<DoctorsStatisticsController>(
          builder: (controller) {
            return Handilingdataview(
              statusrequests: [controller.statusrequest],
              widget: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [StatisticsDoctorCard(), DoctorTable()],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
