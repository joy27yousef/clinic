import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';


CalendarControllerX controller = Get.find();

List<Widget> actionAppBar = [
  PopupMenuButton<CalendarFormat>(
    icon: const Icon(Icons.menu_rounded),
    onSelected: controller.changeFormat,
    itemBuilder: (context) => [
      PopupMenuItem(
        value: CalendarFormat.week,
        child: Text("الأسبوع",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                )),
      ),
      PopupMenuItem(
        value: CalendarFormat.twoWeeks,
        child: Text("أسبوعين",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                )),
      ),
      PopupMenuItem(
        value: CalendarFormat.month,
        child: Text("الشهر",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                )),
      ),
    ],
  ),
];
