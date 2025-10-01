import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/views/doctor/calendar/widget/actionAppBar.dart';
import 'package:clinik_app/views/doctor/calendar/widget/calendardetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorCalendarPage extends StatelessWidget {
  const DoctorCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("جدول المواعيد"), actions: actionAppBar),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getAppointmentsData();
        },
        child: GetBuilder<CalendarControllerX>(
          builder: (controller) => Handilingdataview(
            statusrequests: [controller.statusrequest],
            widget: Padding(
              padding: const EdgeInsets.all(20),
              child: CalendarDetail(),
            ),
          ),
        ),
      ),
    );
  }
}
