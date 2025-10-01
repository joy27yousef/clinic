import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientTable extends StatelessWidget {
  PatientTable({super.key});
  final DoctorsStatisticsController doctorcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عدد المرضى لكل طبيب',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),

        if (doctorcontroller.doctorsList.isEmpty)
          Center(
            child: Text(
              'لا يوجد أطباء',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        else
          Table(
            border: TableBorder.all(color: Appcolor.bas2),
            columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(2)},
            children: [
              // رأس الجدول
              TableRow(
                decoration: BoxDecoration(color: Color(0xFFE6F0F7)),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "اسم الطبيب",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolor.bas2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "عدد المرضى",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolor.bas2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              // الصفوف الديناميكية
              for (var doc in doctorcontroller.doctorsList)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        doc["name"] ?? 'الاسم غير معروف',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '10 ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
      ],
    );
  }
}
