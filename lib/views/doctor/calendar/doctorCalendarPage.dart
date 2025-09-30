import 'package:clinik_app/views/doctor/calendar/widget/actionAppBar.dart';
import 'package:clinik_app/views/doctor/calendar/widget/calendardetail.dart';
import 'package:flutter/material.dart';

class DoctorCalendarPage extends StatelessWidget {
  const DoctorCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("جدول المواعيد"), actions: actionAppBar),
      body: Padding(padding: const EdgeInsets.all(20), child: CalendarDetail()),
    );
  }
}
