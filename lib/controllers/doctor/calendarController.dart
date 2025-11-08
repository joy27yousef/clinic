import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:clinik_app/core/data/models/doctor/doctorScheduleModel.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarControllerX extends GetxController {
  late final AppRepository repo;
  final error = Rxn<ErrorModel>();
  Statusrequest statusrequest = Statusrequest.none;

  final doctorSchedule = Rxn<DoctorScheduleModel>();

  var appointments = <Meeting>[].obs;

  var calendarFormat = CalendarFormat.month.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = Rxn<DateTime>();

  @override
  void onInit() {
    repo = AppRepository(api: DioConsumer(dio: Dio()));
    super.onInit();
    getDoctorSchedule();
  }

  Future<void> getDoctorSchedule() async {
    statusrequest = Statusrequest.loading;
    update();

    final response = await repo.doctorScheduleData();

    response.fold(
      (failure) {
        error.value = failure;
        statusrequest = Statusrequest.serverfailure;
        update();
      },
      (data) {
        if (data.status && data.data != null) {
          doctorSchedule.value = data;
          _mapAppointmentsToMeetings(data.data!.appointments);
          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
        }
        update();
      },
    );
  }

  void _mapAppointmentsToMeetings(List<Appointment> list) {
    appointments.clear();

    for (var appt in list) {
      try {
        final appointmentDate = DateTime.parse(
          appt.appointmentDate ?? '',
        ).toUtc();

        appointments.add(
          Meeting(
            id: appt.id ?? '',
            patientName: appt.patient?.fullName ?? 'مريض غير معروف',
            doctorName: appt.doctor?.name ?? 'دكتور غير معروف',
            from: appointmentDate,
            to: appointmentDate.add(const Duration(hours: 1)),
            background: _getStatusColor(appt.status),
            status: appt.status ?? 'غير معروف',
            notes: appt.notes ?? 'لا توجد ملاحظات',
            fee: appt.fee ?? 'غير معروف',
          ),
        );
      } catch (e) {
        print('⚠️ خطأ في تحويل الموعد: $e');
      }
    }
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'scheduled':
        return Appcolor.base; 
      case 'completed':
        return Colors.greenAccent;
      case 'cancelled':
        return Colors.redAccent;
      default:
        return Appcolor.baselight;
    }
  }

  List<Meeting> getEventsForDay(DateTime day) {
    final dateKey = DateTime(day.year, day.month, day.day);
    return appointments
        .where(
          (m) =>
              m.from.year == dateKey.year &&
              m.from.month == dateKey.month &&
              m.from.day == dateKey.day,
        )
        .toList();
  }

  void changeFormat(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void toggleFormat() {
    calendarFormat.value = calendarFormat.value == CalendarFormat.month
        ? CalendarFormat.week
        : CalendarFormat.month;
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }

  var selectedDate = 0.obs;
  final filters = ["اليوم", "غداً", "هذا الأسبوع"];
  void selectFilter(int index) {
    selectedDate.value = index;
  }
}

class Meeting {
  Meeting({
    required this.id,
    required this.patientName,
    required this.doctorName,
    required this.from,
    required this.to,
    required this.background,
    required this.status,
    required this.notes,
    required this.fee,
  });

  String id;
  String patientName;
  String doctorName;
  DateTime from;
  DateTime to;
  Color background;
  String status;
  String notes;
  String fee;

  String get dateOnly =>
      "${from.year}-${from.month.toString().padLeft(2, '0')}-${from.day.toString().padLeft(2, '0')}";
  String get timeOnly =>
      "${from.hour.toString().padLeft(2, '0')}:${from.minute.toString().padLeft(2, '0')}";
}
