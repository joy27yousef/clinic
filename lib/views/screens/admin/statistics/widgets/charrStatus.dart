import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CharrStatus extends StatelessWidget {
  CharrStatus({super.key});
  final ReportsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final byStatus = controller.reportAppointmentData.value?.data?.byStatus;

    // 🧩 تحقق من وجود بيانات
    if (byStatus == null || byStatus.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            '',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Cairo',
              color: Colors.black54,
            ),
          ),
        ),
      );
    }

    final statusDataMoney = byStatus.map((e) {
      final status = e.status.trim().toLowerCase();
      late Color color;
      late String labelArabic;

      switch (status) {
        case 'completed':
          color = Appcolor.base;
          labelArabic = 'مكتمل';
          break;
        case 'scheduled':
          color = Appcolor.secondary;
          labelArabic = 'مجدول';
          break;
        case 'cancelled':
          color = const Color(0xFFF44336);
          labelArabic = 'ملغى';
          break;
        default:
          color = const Color(0xFF9E9E9E);
          labelArabic = status;
      }

      return _StatusRevenueData(
        labelArabic,
        double.tryParse(e.expectedRevenue.toString()) ?? 0.0,
        double.tryParse(e.actualRevenue.toString()) ?? 0.0,
        color,
      );
    }).toList();

    // 🔍 تحقق إن كانت كل القيم صفر
    final allZero = statusDataMoney.every(
      (data) => data.expected == 0 && data.actual == 0,
    );

    if (allZero) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'لا توجد إيرادات لعرضها بعد 💸',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Cairo',
              color: Colors.black54,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الإيرادات حسب الحالة',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 320,
          child: SfCircularChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
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
              borderWidth: 1.5,
              borderColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
              format: 'الحالة: point.x\nالقيمة: point.y',
            ),
            series: <DoughnutSeries<_StatusRevenueData, String>>[
              DoughnutSeries<_StatusRevenueData, String>(
                dataSource: statusDataMoney,
                xValueMapper: (_StatusRevenueData data, _) => data.status,
                yValueMapper: (_StatusRevenueData data, _) => data.expected,
                pointColorMapper: (_StatusRevenueData data, _) => data.color,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.curve,
                    length: '15%',
                    color: Colors.grey,
                  ),
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Cairo',
                  ),
                ),
                radius: '80%',
                innerRadius: '55%',
                explode: true,
                explodeGesture: ActivationMode.singleTap,
                animationDuration: 900,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _StatusRevenueData {
  final String status;
  final double expected;
  final double actual;
  final Color color;

  _StatusRevenueData(this.status, this.expected, this.actual, this.color);
}
