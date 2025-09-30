import 'package:clinik_app/views/doctor/calendar/doctorCalendarPage.dart';
import 'package:clinik_app/views/doctor/home/doctorHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorBaseController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var selectedIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> buildScreens(context) {
    return [DoctorHomePage(scaffoldKey: scaffoldKey), DoctorCalendarPage()];
  }
}
