import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/data/remote/doctor/appointments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:clinik_app/core/constant/AppColor.dart';

class CalendarControllerX extends GetxController {
  final AppointmentsData appointmentsData = AppointmentsData(
    crud: Get.find<Crud>(),
  );
  final box = GetStorage();

  Statusrequest statusrequest = Statusrequest.none;

  var appointments = <Meeting>[].obs;
  var calendarFormat = CalendarFormat.month.obs;

  var focusedDay = DateTime.now().obs;
  var selectedDay = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    getAppointmentsData();
  }

  Future<void> getAppointmentsData() async {
    statusrequest = Statusrequest.loading;
    update();

    // var user = box.read('userData');
    // var response = await appointmentsData.getData(
    //   doctorId: user['id'] ,
    // );
    var response = await appointmentsData.getData(
      doctorId: '01999ebc-602b-70f9-bec5-7929e8d8bbc7',
    );

    update();

    response.fold(
      (failure) {
        statusrequest = Statusrequest.serverfailure;
        print('❌ error server');
        update();
      },
      (data) async {
        if (data['status'] == true) {
          appointments.clear();

          List<dynamic> appointmentsList = data['data']['data'];

          for (var item in appointmentsList) {
            appointments.add(Meeting.fromJson(item));
          }

          statusrequest = Statusrequest.success;
        } else {
          statusrequest = Statusrequest.failure;
          print('⚠️ error in response');
        }
        update();
      },
    );

    update();
  }

  /// فلترة المواعيد حسب اليوم
  List<Meeting> getEventsForDay(DateTime day, RxList<Meeting> appointments) {
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

  /// تغيير تنسيق التقويم
  void changeFormat(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void toggleFormat() {
    if (calendarFormat.value == CalendarFormat.month) {
      calendarFormat.value = CalendarFormat.week;
    } else {
      calendarFormat.value = CalendarFormat.month;
    }
  }

  /// اختيار يوم معين
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
  DateTime from; // الوقت الكامل
  DateTime to; // الوقت الكامل
  Color background;
  String status;
  String notes;
  String fee;

  // إضافات لفصل التاريخ عن الوقت
  String get dateOnly =>
      "${from.year}-${from.month.toString().padLeft(2, '0')}-${from.day.toString().padLeft(2, '0')}";
  String get timeOnly =>
      "${from.hour.toString().padLeft(2, '0')}:${from.minute.toString().padLeft(2, '0')}";

  factory Meeting.fromJson(Map<String, dynamic> json) {
    DateTime appointment = DateTime.parse(json['appointment_date']).toLocal();
    return Meeting(
      id: json['id'] ?? '',
      patientName: json['patient']?['full_name'] ?? 'مريض غير معروف',
      doctorName: json['doctor']?['name'] ?? 'دكتور غير معروف',
      from: appointment,
      to: appointment.add(const Duration(hours: 1)), // مدة الموعد ساعة
      background: Appcolor.baselight,
      status: json['status'] ?? 'غير معروف',
      notes: json['notes'] ?? 'لا يوجد ملاحظات',
      fee: json['fee'] ?? 'غير معروف',
    );
  }
}
