import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppFont.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات ثابتة ستاتيكية
    final appointmentStats = {
      "total_appointments": 21,
      "scheduled_appointments": 14,
      "completed_appointments": 5,
      "cancelled_appointments": 2,
      "unassigned_appointments": 0,
    };

    final feesStats = {"min": 5000.0, "max": 50000.0, "avg": 14000.0};

    final inoutStats = {"الواردات": 12000, "الصادرات": 8000};

    final completionRate =
        appointmentStats['completed_appointments']! /
        appointmentStats['total_appointments']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "  إحصائيات العيادة",
          style: Theme.of(
            context,
          ).appBarTheme.titleTextStyle!.copyWith(fontSize: 17),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'توزيع المواعيد',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // 1️⃣ Pie Chart لتوزيع المواعيد
          SfCircularChart(
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              textStyle: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: 15),
            ),
            series: <CircularSeries<_ChartData, String>>[
              DoughnutSeries<_ChartData, String>(
                dataSource: [
                  _ChartData('مجدولة', 14, Appcolor.bas2),
                  _ChartData('مكتملة', 5, Appcolor.base),
                  _ChartData('ملغاة', 2, Colors.red.shade300),
                ],
                xValueMapper: (_ChartData d, _) => d.label,
                yValueMapper: (_ChartData d, _) => d.value,
                pointColorMapper: (_ChartData d, _) => d.color,
                dataLabelMapper: (_ChartData d, _) => '${d.value}',
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
          Text(
            'الصادرات والواردات',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // 2️⃣ Column Chart للصادرات والواردات
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <CartesianSeries<_BarData, String>>[
              ColumnSeries<_BarData, String>(
                dataSource: [
                  _BarData('الواردات', 12000, Appcolor.base),
                  _BarData('الصادرات', 8000, Appcolor.bas2),
                ],

                xValueMapper: (_BarData data, _) => data.label,
                yValueMapper: (_BarData data, _) => data.value,
                pointColorMapper: (_BarData data, _) => data.color,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Appcolor.bas2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
          Text(
            'نسبة الإنجاز الأسبوعية',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // 3️⃣ Line Chart لنسبة الإنجاز (ستاتيكي على أيام الأسبوع)
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 1),
            series: <CartesianSeries<_LineData, String>>[
              LineSeries<_LineData, String>(
                dataSource: [
                  _LineData('الإثنين', 0.2),
                  _LineData('الثلاثاء', 0.4),
                  _LineData('الأربعاء', 0.6),
                  _LineData('الخميس', 0.5),
                  _LineData('الجمعة', 0.7),
                  _LineData('السبت', 0.8),
                  _LineData('الأحد', completionRate),
                ],
                xValueMapper: (_LineData data, _) => data.day,
                yValueMapper: (_LineData data, _) => data.value,
                color: Appcolor.base,

                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 15,
                    color: Appcolor.bas2,
                  ),
                ),
                markerSettings: MarkerSettings(isVisible: true),
              ),
            ],
          ),

          // 6️⃣ Line Chart لتطور المواعيد مع الوقت
          const SizedBox(height: 40),
          Text(
            'تطور المواعيد مع الوقت',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0),
            series: <CartesianSeries<_LineData, String>>[
              LineSeries<_LineData, String>(
                dataSource: [
                  _LineData('الإثنين', 3),
                  _LineData('الثلاثاء', 4),
                  _LineData('الأربعاء', 5),
                  _LineData('الخميس', 6),
                  _LineData('الجمعة', 2),
                  _LineData('السبت', 1),
                  _LineData('الأحد', 0),
                ],
                xValueMapper: (_LineData data, _) => data.day,
                yValueMapper: (_LineData data, _) => data.value,
                color: Appcolor.base,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 15,
                    color: Appcolor.bas2,
                  ),
                ),
                markerSettings: const MarkerSettings(isVisible: true),
              ),
            ],
          ),

          const SizedBox(height: 40),
          Text(
            'أجور الاستشارة',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // 4️⃣ Bar Chart للأجور
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <CartesianSeries<_BarData, String>>[
              BarSeries<_BarData, String>(
                dataSource: [
                  _BarData('أعلى أجر', feesStats['max']!, Appcolor.bas2),
                  _BarData('متوسط أجر', feesStats['avg']!, Appcolor.base),
                  _BarData('أقل أجر', feesStats['min']!, Colors.teal),
                ],
                xValueMapper: (_BarData data, _) => data.label,
                yValueMapper: (_BarData data, _) => data.value,
                pointColorMapper: (_BarData data, _) => data.color,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    color: Appcolor.bas2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

// بيانات Pie/Doughnut
class _ChartData {
  final String label;
  final int value;
  final Color color;
  _ChartData(this.label, this.value, this.color);
}

// بيانات Bar Chart
class _BarData {
  final String label;
  final double value;
  final Color color;
  _BarData(this.label, this.value, this.color);
}

// بيانات Line Chart
class _LineData {
  final String day;
  final double value;
  _LineData(this.day, this.value);
}
