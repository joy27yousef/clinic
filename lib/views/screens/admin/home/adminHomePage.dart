import 'package:clinik_app/controllers/admin/appointmentsSatisticsController.dart';
import 'package:clinik_app/controllers/admin/doctorsStatisticsController.dart';
import 'package:clinik_app/controllers/admin/patientStatisticsController.dart';
import 'package:clinik_app/controllers/admin/reportsController.dart';
import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/cache/cacheHelper.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/getGreeting.dart';
import 'package:clinik_app/views/screens/admin/home/widgets/systemView.dart';
import 'package:clinik_app/views/widgets/welcomePart.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomepage extends StatelessWidget {
  AdminHomepage({super.key, required this.scaffoldKey});
  GlobalKey<ScaffoldState> scaffoldKey;
  AppointmentsStatisticsController controller1 = Get.find();
  DoctorsStatisticsController controller2 = Get.find();
  ReportsController controller3 = Get.find();
  PatientStatisticsController controller4 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 35,
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: const Icon(Icons.menu_rounded),
        ),
        title: Text(
          '${getGreeting()}  ${CacheHelper().getData(key: GeneralKey.userName)}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 17,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller1.getAppointmentsStats();
          await controller2.getDoctors();
          await controller3.getAppointmentsRevenue();
          await controller3.getMonthlyProfitReport();
          await controller3.getcomprehensiveReport();
          await controller4.getPatientsData();
          await controller4.getRecordsData();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              WelcomePart(
                containerColor: Appcolor.bas2,
                textColor: Colors.white,
              ),
              SystemView(),
            ],
          ),
        ),
      ),
    );
  }
}
