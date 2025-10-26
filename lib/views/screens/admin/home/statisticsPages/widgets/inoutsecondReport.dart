import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InoutsecondReport extends StatelessWidget {
  InoutsecondReport({super.key});
  ReportsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final data = controller.reportAppointmentData.value?.data;

    return GetBuilder<ReportsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إيرادات المواعيد :',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
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
                        'الإيرادات المتوقعة',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${data?.expectedRevenue?.total}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.base),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'المدفوع : ${data?.expectedRevenue?.paid}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'غير المدفوع : ${data?.expectedRevenue?.unpaid}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
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
                        'الإيرادات الفعلية',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${data?.actualRevenue?.total}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.base),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'متوسط : ${data?.actualRevenue?.average}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'عدد  : ${data?.actualRevenue?.count}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
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
                        'الفروقات',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${data?.difference?.amount}",
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
          ],
        );
      },
    );
  }
}
