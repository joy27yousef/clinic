import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/widgets/inoutDoctorReport.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/widgets/inoutfirstReport.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/widgets/inoutsecondReport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSatistics extends StatelessWidget {
  InputSatistics({super.key});
  ReportsController controller = Get.find();

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
            await controller.getAppointmentsRevenue();
            await controller.getMonthlyProfitReport();
            await controller.getcomprehensiveReport();
          },

          child: GetBuilder<ReportsController>(
            builder: (controller) {
              return Handilingdataview(
                statusrequests: [controller.statusrequest],
                widget: ListView(
                  children: [
                    InoutfirstReport(),
                    InoutsecondReport(),
                    InoutdoctorReport(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
