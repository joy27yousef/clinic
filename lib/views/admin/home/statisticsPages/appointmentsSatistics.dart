import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/widgets/appointmentStatisticsCard.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/widgets/appointmentTable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsSatistics extends StatelessWidget {
  AppointmentsSatistics({super.key});
  AppointmentsSatisticsController controller = Get.find();
  DoctorsStatisticsController doctorcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المواعيد في النظام'),
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
          await controller.getAppointmentsStatsData();
        },
        child: GetBuilder<AppointmentsSatisticsController>(
          builder: (controller) {
            return Handilingdataview(
              statusrequests: [controller.statusrequest],
              widget: Padding(
                padding: const EdgeInsets.all(18),
                child: ListView(
                  children: [AppointmentStatisticsCard(), AppointmentTable()],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
