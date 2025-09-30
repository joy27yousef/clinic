import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/getGreeting.dart';
import 'package:clinik_app/core/function/saveToken.dart';
import 'package:clinik_app/views/admin/home/widgets/systemView.dart';
import 'package:clinik_app/views/doctor/home/widgets/welcomePart.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatelessWidget {
  AdminHomepage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

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
          '${getGreeting()}  ${box.read('userData')?['user']?['name'] ?? ''}',
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
            WelcomePart(containerColor: Appcolor.bas2, textColor: Colors.white),
            SystemView(),
          ],
        ),
      ),
    );
  }
}
