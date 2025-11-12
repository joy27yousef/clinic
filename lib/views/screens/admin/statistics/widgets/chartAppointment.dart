import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartAppointment extends StatelessWidget {
  ChartAppointment({super.key});
  final ReportsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final appointments =
        controller.reportAppointmentData.value?.data?.appointmentsCount;

    if (appointments == null) {
      return const Center(
        child: Text(
          'لا توجد بيانات متاحة حالياً',
          style: TextStyle(fontSize: 16, fontFamily: 'Cairo'),
        ),
      );
    }

    final total = appointments.total ?? 0;
    if (total == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إحصائيات المواعيد :',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'لا توجد مواعيد لعرضها ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ],
      );
    }

    final statusData = [
      _AppointmentData('مكتمل', appointments.completed, Appcolor.base),
      _AppointmentData('مجدول', appointments.scheduled, Appcolor.secondary),
      _AppointmentData('ملغى', appointments.cancelled, Colors.red.shade400),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إحصائيات المواعيد :',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'إجمالي عدد المواعيد: $total',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 10),
        SfCircularChart(
          legend: Legend(
            isVisible: true,
            position: LegendPosition.top,
            overflowMode: LegendItemOverflowMode.scroll,
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          tooltipBehavior: TooltipBehavior(
            enable: true,
            header: '',
            format: 'point.x : point.y عدد المواعيد',
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            canShowMarker: true,
            borderColor: Colors.white,
            borderWidth: 1,
            color: Appcolor.primarytext,
          ),
          series: <DoughnutSeries<_AppointmentData, String>>[
            DoughnutSeries<_AppointmentData, String>(
              dataSource: statusData,
              xValueMapper: (_AppointmentData data, _) => data.type,
              yValueMapper: (_AppointmentData data, _) => data.count,
              pointColorMapper: (_AppointmentData data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                connectorLineSettings: ConnectorLineSettings(
                  length: '20%',
                  color: Colors.grey,
                  width: 1,
                ),
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                ),
                borderRadius: 10,
                labelIntersectAction: LabelIntersectAction.shift,
              ),
              radius: '80%',
              explode: true,
              // explodeIndex: 0,
              explodeOffset: '8%',
              explodeGesture: ActivationMode.singleTap,
              animationDuration: 900,
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _AppointmentData {
  final String type;
  final int count;
  final Color color;

  _AppointmentData(this.type, this.count, this.color);
}
