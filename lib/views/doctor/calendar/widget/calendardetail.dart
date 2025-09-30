import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppFont.dart';
import 'package:clinik_app/core/function/statusView.dart';
import 'package:clinik_app/core/function/viewMeetingDetails.dart';
import 'package:clinik_app/views/doctor/widgets/meetingCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDetail extends StatelessWidget {
  CalendarDetail({super.key});

  CalendarControllerX controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => TableCalendar<Meeting>(
              locale: "ar",
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2050, 12, 31),
              focusedDay: controller.focusedDay.value,
              calendarFormat: controller.calendarFormat.value,
              selectedDayPredicate: (day) =>
                  isSameDay(controller.selectedDay.value, day),
              eventLoader: (day) =>
                  controller.getEventsForDay(day, controller.appointments),
              startingDayOfWeek: StartingDayOfWeek.saturday,

              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                headerPadding: EdgeInsets.zero,
                headerMargin: EdgeInsets.zero,
                titleTextStyle: Theme.of(context).textTheme.titleLarge!,
                decoration: BoxDecoration(color: Appcolor.backgroundLight),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: AppFonts.Cairo,
                  fontSize: 12,
                ),
                weekendStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontFamily: AppFonts.Cairo,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Appcolor.base,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Appcolor.base,
                  shape: BoxShape.circle,
                ),
              ),

              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isEmpty) return const SizedBox();

                  return Positioned(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: events.map((meeting) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 1.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: meeting.status == "completed"
                                ? Colors.green.shade300
                                : meeting.status == "cancelled"
                                ? Colors.red.shade300
                                : meeting.status == "scheduled"
                                ? Colors.blue.shade300
                                : Colors.grey.shade300,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),

              onDaySelected: (selectedDay, focusedDay) {
                controller.onDaySelected(selectedDay, focusedDay);
              },
            ),
          ),

          Container(
            height: 5,
            width: 40,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// قائمة المواعيد لليوم المختار
          Expanded(
            child: Obx(() {
              final events = controller.getEventsForDay(
                controller.selectedDay.value ?? controller.focusedDay.value,
                controller.appointments,
              );

              if (events.isEmpty) {
                return Center(
                  child: Text(
                    "لا يوجد مواعيد، حالياً",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 15),
                  ),
                );
              }

              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final meeting = events[index];

                  return MeetingCard(meeting: meeting);
                },
              );
            }),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
