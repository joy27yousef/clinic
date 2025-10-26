import 'package:clinik_app/controllers/admin/patientStatisticsController.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/screens/admin/home/statisticsPages/widgets/statisticsPatientCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientStatistics extends StatelessWidget {
  final PatientStatisticsController controller = Get.find();

  PatientStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المرضى في النظام'),
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
          await controller.getPatientsData();
          await controller.getRecordsData();
        },
        child: GetBuilder<PatientStatisticsController>(
          builder: (controller) {
            return Handilingdataview(
              statusrequests: [controller.statusrequest],
              widget: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    StatisticsPatientCard(),
                    // PatientTable()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
