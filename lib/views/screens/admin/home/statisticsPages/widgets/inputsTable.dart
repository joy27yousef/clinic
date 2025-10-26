import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputsTable extends StatelessWidget {
  DoctorsStatisticsController dcontroller = Get.find();
  InputsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أجر المعاينة لكل طبيب',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 20),

        if (dcontroller.doctorsList.isEmpty)
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
                      "الأجر لكل معاينة",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolor.bas2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              // الصفوف الديناميكية
              for (var doc in dcontroller.doctorsList)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        doc.name ?? 'الاسم غير معروف',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        doc.consultationFee ?? ' غير معروف',
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
