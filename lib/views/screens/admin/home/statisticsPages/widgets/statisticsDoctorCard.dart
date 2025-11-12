import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsDoctorCard extends StatelessWidget {
  StatisticsDoctorCard({super.key});
  DoctorsStatisticsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final numbers = [
      controller.totalDoctors,
      controller.availableDoctors,
      controller.unavailableDoctors,
      controller.specializationsCount,
    ];
    return GridView.builder(
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
                  '${numbers[i]}',
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
                color: Appcolor.secondary,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
