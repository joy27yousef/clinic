import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/controllers/admin/inoutStatisticsController.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/widgets/inputsStatisticsCard.dart';
import 'package:clinik_app/views/admin/home/statisticsPages/widgets/inputsTable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSatistics extends StatelessWidget {
  InputSatistics({super.key});
  DoctorsStatisticsController dcontroller = Get.find();
  InoutStatisticsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الايرادات في النظام'),
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
        child: RefreshIndicator(
          color: Appcolor.bas2,
          onRefresh: () async {
            await controller.getAppointmentsStatsData();
          },
          child: GetBuilder<InoutStatisticsController>(
            builder: (controller) {
              return Handilingdataview(
                statusrequests: [controller.statusrequest],
                widget: ListView(
                  children: [InputsstatiSticsCard(), InputsTable()],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
