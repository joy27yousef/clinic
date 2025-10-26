import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:clinik_app/views/screens/admin/statistics/widgets/charrStatus.dart';
import 'package:clinik_app/views/screens/admin/statistics/widgets/chartAppointment.dart';
import 'package:clinik_app/views/screens/admin/statistics/widgets/chartDoctor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:clinik_app/core/class/statusRequest.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportsController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إحصائيات العيادة',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.statusrequest == Statusrequest.loading) {
          return Center(
            child: Lottie.asset(Appimages.loading, width: 150, height: 150),
          );
        }

        if (controller.statusrequest == Statusrequest.serverfailure ||
            controller.reportAppointmentData.value == null) {
          return const Center(child: Text("حدث خطأ في تحميل البيانات"));
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [ChartAppointment(), ChartDoctor(), CharrStatus()],
          ),
        );
      }),
    );
  }
}
