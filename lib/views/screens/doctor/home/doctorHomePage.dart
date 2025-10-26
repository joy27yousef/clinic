import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/cache/cacheHelper.dart';
import 'package:clinik_app/core/class/handilingDataView.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/getGreeting.dart';
import 'package:clinik_app/views/screens/doctor/calendar/widget/actionAppBar.dart';
import 'package:clinik_app/views/screens/doctor/home/widgets/dailyAppointments.dart';
import 'package:clinik_app/views/widgets/welcomePart.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';

class DoctorHomePage extends StatelessWidget {
  DoctorHomePage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 35,
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Icon(Icons.menu_rounded),
        ),
        title: Text(
          '${getGreeting()}  ${CacheHelper().getData(key: GeneralKey.userName) ?? ''}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 17,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Appcolor.base,
        onRefresh: () async {
          await controller.getDoctorSchedule();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<CalendarControllerX>(
            builder: (controller) => Handilingdataview(
              statusrequests: [controller.statusrequest],
              widget: ListView(
                children: [
                  WelcomePart(
                    containerColor: Appcolor.base,
                    textColor: Colors.white,
                  ),
                  DailyAppointments(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
