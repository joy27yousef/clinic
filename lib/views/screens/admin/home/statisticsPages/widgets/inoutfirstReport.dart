import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:clinik_app/core/function/translation.dart';

class InoutfirstReport extends StatelessWidget {
  InoutfirstReport({super.key});
  ReportsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final totaldata = controller.comprehensiveReportData.value?.data;

    return GetBuilder<ReportsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إجمالي الإيرادات',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${totaldata?.revenue?.total}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.base),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إجمالي المصاريف',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${totaldata?.expenses?.total}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.base),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'صافي الربح',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${totaldata?.profit?.netProfit}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.base),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'هامش الربح',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${totaldata?.profit?.profitMargin} %",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.base),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'تفاصيل المصاريف حسب الفئة :',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: DataTable(
                columnSpacing: 20,

                headingRowColor: WidgetStateProperty.all(Colors.grey.shade200),
                columns: [
                  DataColumn(
                    label: Text(
                      'الفئة',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        color: Appcolor.base,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'الإجمالي',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        color: Appcolor.base,
                      ),
                    ),
                  ),
                ],
                rows: totaldata!.expenses!.byCategory
                    .map(
                      (e) => DataRow(
                        cells: [
                          DataCell(
                            FutureBuilder<String>(
                              future: translateText(e.category, 'ar'),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text("...");
                                }
                                return Text(
                                  snapshot.data!,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                );
                              },
                            ),
                          ),

                          DataCell(
                            Text(
                              '${e.total}',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
