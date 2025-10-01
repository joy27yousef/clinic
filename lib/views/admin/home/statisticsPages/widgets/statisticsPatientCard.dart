import 'package:clinik_app/controllers/admin/patientStatisticsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsPatientCard extends StatelessWidget {
  StatisticsPatientCard({super.key});
  final PatientStatisticsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List<dynamic> cardData = [
      controller.totalPatient,
      controller.recordsList[0]['records_with_treatment'] ?? 0,
      controller.recordsList[0]['records_with_prescriptions'] ?? 0,
      controller.recordsList[0]['records_with_diagnosis'] ?? 0,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.title.length,
          itemBuilder: (context, i) => Container(
            height: 70,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.title[i],
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Appcolor.bas2,
                    fontSize: 17,
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Appcolor.bas2,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: Text(
                      "${cardData[i]}",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
