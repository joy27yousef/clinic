import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/screens/doctor/widgets/meetingCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyAppointments extends StatelessWidget {
  DailyAppointments({super.key});

  final CalendarControllerX controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'جدول مواعيد المرضى :',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 20),
        Obx(() {
          return Row(
            children: List.generate(controller.filters.length, (index) {
              final isSelected = controller.selectedDate.value == index;
              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () => controller.selectFilter(index),
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.grey.shade100
                          : Colors.grey.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: isSelected ? Appcolor.base : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        controller.filters[index],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          color: isSelected
                              ? Appcolor.base
                              : Colors.grey.shade500,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
        SizedBox(height: 20),
        Obx(() {
          DateTime today = DateTime.now();
          DateTime tomorrow = today.add(const Duration(days: 1));
          DateTime weekStart = today.subtract(
            Duration(days: today.weekday - 1),
          );
          DateTime weekEnd = weekStart.add(const Duration(days: 6));
          List<Meeting> filteredAppointments = [];
          switch (controller.selectedDate.value) {
            case 0:
              filteredAppointments = controller.getEventsForDay(today);
              break;
            case 1:
              filteredAppointments = controller.getEventsForDay(tomorrow);
              break;
            case 2:
              filteredAppointments = controller.appointments
                  .where(
                    (m) =>
                        m.from.isAfter(
                          weekStart.subtract(const Duration(seconds: 1)),
                        ) &&
                        m.from.isBefore(weekEnd.add(const Duration(days: 1))),
                  )
                  .toList();
              break;
          }
          if (filteredAppointments.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "لا يوجد مواعيد، حالياً",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(fontSize: 15),
                ),
              ),
            );
          }

          return Column(
            children: filteredAppointments.map((meeting) {
              return MeetingCard(meeting: meeting);
            }).toList(),
          );
        }),
        SizedBox(height: 70),
      ],
    );
  }
}
