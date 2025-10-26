import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inoutapporeport extends StatelessWidget {
  Inoutapporeport({super.key});
  ReportsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final datastatus = controller.reportAppointmentData.value!.data!.byStatus;

    return GetBuilder<ReportsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تفاصيل الإيرادات حسب حالة المواعيد :',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
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
                      'الحالة',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        color: Appcolor.base,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'متوقع',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        color: Appcolor.base,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'فعلي',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        color: Appcolor.base,
                      ),
                    ),
                  ),
                ],
                rows: datastatus!
                    .map(
                      (e) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              e.status == 'scheduled'
                                  ? 'مجدولة'
                                  : e.status == 'completed'
                                  ? 'مكتملة'
                                  : 'ملغية',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${e.expectedRevenue}',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${e.actualRevenue}',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontSize: 14,
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
            SizedBox(height: 50),
          ],
        );
      },
    );
  }
}
