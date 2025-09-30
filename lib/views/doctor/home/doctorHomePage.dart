import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/getGreeting.dart';
import 'package:clinik_app/views/doctor/home/widgets/dailyAppointments.dart';
import 'package:clinik_app/views/doctor/home/widgets/welcomePart.dart';
import 'package:flutter/material.dart';
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
          '${getGreeting()} د. ${box.read('userData')?['user']?['name'] ?? ''}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            WelcomePart(
              containerColor: Appcolor.baselight,
              textColor: Appcolor.bas2,
            ),
            DailyAppointments(),
          ],
        ),
      ),
    );
  }
}
