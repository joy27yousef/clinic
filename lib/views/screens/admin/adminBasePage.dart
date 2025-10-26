import 'package:clinik_app/controllers/admin/adminBaseController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/widgets/openDrawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AdminBasePage extends StatelessWidget {
  AdminBasePage({super.key});

  final AdminBaseController controller = Get.find();
  final PersistentTabController persistentController = PersistentTabController(
    initialIndex: 0,
  );

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          contentPadding: 2,

          icon: const Icon(Iconsax.home_2),
          title: "  الرئيسية",
          textStyle: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: 15),
          activeColorPrimary: Appcolor.bas2,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          contentPadding: 2,

          icon: const Icon(Iconsax.status_up),
          title: " الإحصائيات",
          textStyle: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: 15),
          activeColorPrimary: Appcolor.bas2,
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
          controller: persistentController,
          screens: controller.buildScreens(context),
          items: navBarsItems(),
          confineToSafeArea: true,
          margin: EdgeInsets.all(10),
          backgroundColor: Appcolor.backgroundLight,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarStyle: NavBarStyle.style1,
          onItemSelected: (index) {
            controller.changePage(index);
            persistentController.jumpToTab(index);
          },
        ),
      ),
    );
  }
}
