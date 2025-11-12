import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentStatisticsCard extends StatelessWidget {
  AppointmentStatisticsCard({super.key});
  final AppointmentsStatisticsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // إذا لم يتم تحميل البيانات بعد، نعرض CircularProgressIndicator
      if (controller.statusrequest == Statusrequest.loading ||
          controller.appointmentStats.value == null) {
        return const Center(child: CircularProgressIndicator());
      }

      // قائمة البيانات المأخوذة من الكائن
      List<int> statusData = [
        controller.appointmentStats.value?.totalAppointments ?? 0,
        controller.appointmentStats.value?.scheduledAppointments ?? 0,
        controller.appointmentStats.value?.completedAppointments ?? 0,
        controller.appointmentStats.value?.cancelledAppointments ?? 0,
      ];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.titles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, i) => Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Appcolor.bas2,
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                      child: Text(
                        '${statusData[i]}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    controller.titles[i],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolor.secondary,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'نسبة إتمام المعاينات',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 20),
          // Progress bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                value: controller.completionRate,
                minHeight: 20,
                color: Appcolor.base,
                backgroundColor: Colors.grey.shade300,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${(controller.completionRate * 100).toStringAsFixed(1)}%",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      );
    });
  }
}
