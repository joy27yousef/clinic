import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDoctor extends StatelessWidget {
  final ReportsController controller = Get.find();

  ChartDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorData = controller.reportAppointmentData.value?.data?.byDoctor;

    //  التحقق من وجود بيانات
    if (doctorData == null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إحصائيات الأطباء :',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'لا يوجد  إحصائيات لعرضها ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final chartDoctorData = doctorData
        .map(
          (e) => _DoctorRevenueData(
            e.doctor?.name ?? 'غير معروف',
            e.expectedRevenue ?? 0.0,
            e.actualRevenue ?? 0.0,
          ),
        )
        .toList();

    // 🔍 التحقق من أن كل القيم = صفر
    final allZero = chartDoctorData.every(
      (item) => item.expected == 0 && item.actual == 0,
    );

    if (allZero) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إحصائيات الأطباء :',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'لا توجد إيرادات لعرضها  ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // ✅ في حال وجود بيانات فعلية
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الإيرادات حسب الطبيب',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 350,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Builder(
              builder: (context) {
                final totalWidth = chartDoctorData.fold<double>(
                  0,
                  (sum, item) => sum + (item.name.length * 6.5),
                );

                final chartWidth =
                    totalWidth < MediaQuery.of(context).size.width
                    ? MediaQuery.of(context).size.width
                    : totalWidth;

                return SizedBox(
                  width: chartWidth,
                  child: SfCartesianChart(
                    legend: Legend(
                      isVisible: true,
                      position: LegendPosition.top,
                      overflowMode: LegendItemOverflowMode.scroll,
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: '',
                      color: const Color(0xFF263238),
                      borderWidth: 1.2,
                      borderColor: Colors.white,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                      format: 'الطبيب: point.x \nالقيمة بالليرة: point.y',
                    ),
                    primaryXAxis: CategoryAxis(
                      labelStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.black87,
                        fontFamily: 'Cairo',
                      ),
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    series: <CartesianSeries<_DoctorRevenueData, String>>[
                      ColumnSeries<_DoctorRevenueData, String>(
                        name: 'الإيراد المتوقع',
                        dataSource: chartDoctorData,
                        xValueMapper: (_DoctorRevenueData data, _) => data.name,
                        yValueMapper: (_DoctorRevenueData data, _) =>
                            data.expected,
                        color: Appcolor.secondary,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        enableTooltip: true,
                        animationDuration: 900,
                      ),
                      ColumnSeries<_DoctorRevenueData, String>(
                        name: 'الإيراد الفعلي',
                        dataSource: chartDoctorData,
                        xValueMapper: (_DoctorRevenueData data, _) => data.name,
                        yValueMapper: (_DoctorRevenueData data, _) =>
                            data.actual,
                        color: Appcolor.base,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        enableTooltip: true,
                        animationDuration: 900,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _DoctorRevenueData {
  final String name;
  final double expected;
  final double actual;

  _DoctorRevenueData(this.name, this.expected, this.actual);
}
