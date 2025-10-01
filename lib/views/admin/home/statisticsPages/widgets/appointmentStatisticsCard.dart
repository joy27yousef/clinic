import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/doctor/calendar/widget/actionAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AppointmentStatisticsCard extends StatelessWidget {
  AppointmentStatisticsCard({super.key});
  AppointmentsSatisticsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List statusData = [
      controller.appointmentStats['total_appointments'],
      controller.appointmentStats['scheduled_appointments'],
      controller.appointmentStats['completed_appointments'],
      controller.appointmentStats['cancelled_appointments'],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.title.length,
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
                  controller.title[i],
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Appcolor.bas2,
                  ),
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
        Obx(() {
          double progress = controller.completionRate;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                value: progress,
                minHeight: 20,
                color: Appcolor.base,
                backgroundColor: Colors.grey.shade300,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(),
                  Text(
                    "${(progress * 100).toStringAsFixed(1)}%",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          );
        }),
        const SizedBox(height: 30),
      ],
    );
  }
}
