import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorTable extends StatelessWidget {
  DoctorTable({super.key});
  DoctorsStatisticsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final filtered = controller.filteredDoctors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          'جدول الأطباء',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),

        // أزرار الفلترة
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(controller.filters.length, (i) {
            final isSelected = controller.selectedFilter.value == i;
            return GestureDetector(
              onTap: () => controller.selectFilter(i),
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Appcolor.bas2 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  controller.filters[i],
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: isSelected ? Colors.white : Colors.grey.shade500,
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 30),

        // الجدول الديناميكي
        if (filtered.isEmpty)
          Center(
            child: Text(
              controller.selectedFilter.value == 1
                  ? "لا يوجد أطباء متاحين"
                  : controller.selectedFilter.value == 2
                  ? "لا يوجد أطباء غير متاحين"
                  : "لا يوجد أطباء",
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
                      "الاسم",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolor.bas2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "التخصص",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolor.bas2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              // الصفوف الديناميكية
              for (var doc in filtered)
                TableRow(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            title: Text(
                              doc["name"] ?? '',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize:
                                    MainAxisSize.min, // يقلل من تمدد العمود
                                children: [
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'الإختصاص',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: Appcolor.bas2,
                                              fontSize: 17,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        doc["specialization"] ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'رقم الهاتف',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: Appcolor.bas2,
                                              fontSize: 17,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        doc["phone"] ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'أجر المعاينة',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: Appcolor.bas2,
                                              fontSize: 17,
                                            ),
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        doc["consultation_fee"] ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'السيرة الذاتية',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Appcolor.bas2,
                                          fontSize: 17,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    doc["bio"] ?? 'لا يوجد حالياً',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          doc["name"] ?? '',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        doc["specialization"] ?? '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
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
