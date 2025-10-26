import 'package:clinik_app/controllers/doctor/doctorBaseController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/widgets/openDrawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DoctorBasePage extends StatelessWidget {
  DoctorBasePage({super.key});

  final DoctorBaseController controller = Get.find();
  final PersistentTabController _persistentController = PersistentTabController(
    initialIndex: 0,
  );

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          contentPadding: 2,
          icon: const Icon(Iconsax.home_2),
          title: "  الرئيسية",
          textStyle: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: 15),
          activeColorPrimary: Appcolor.base,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          contentPadding: 2,

          icon: const Icon(Iconsax.calendar_1),
          title: " المواعيد",
          textStyle: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: 15),
          activeColorPrimary: Appcolor.base,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: Drawer(
        backgroundColor: Appcolor.backgroundLight,
        child: OpenDrawer(),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: PersistentTabView(
          context,
          controller: _persistentController,
          screens: controller.buildScreens(context),
          items: _navBarsItems(),
          confineToSafeArea: true,
          margin: EdgeInsets.all(10),
          backgroundColor: Appcolor.backgroundLight,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarStyle: NavBarStyle.style1,
          onItemSelected: (index) {
            controller.changePage(index);
            _persistentController.jumpToTab(index);
          },
        ),
      ),
    );
  }
}
