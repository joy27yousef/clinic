import 'package:clinik_app/controllers/admin/adminBaseController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/views/widgets/openDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminBasePage extends StatefulWidget {
  const AdminBasePage({super.key});

  @override
  State<AdminBasePage> createState() => _AdminBasePageState();
}

class _AdminBasePageState extends State<AdminBasePage>
    with SingleTickerProviderStateMixin {
  final AdminBaseController controller = Get.find();
  int currentIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": Iconsax.home_2, "title": "الرئيسية"},
    {"icon": Iconsax.status_up, "title": "الإحصائيات"},
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            controller.buildScreens(context)[currentIndex],

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(color: Appcolor.backgroundLight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final bool isActive = currentIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        controller.changePage(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Appcolor.bas2.withOpacity(0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item["icon"],
                              color: isActive
                                  ? Appcolor.bas2
                                  : Colors.grey[500],
                              size: 24,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              item["title"],
                              style: isActive
                                  ? Theme.of(
                                      context,
                                    ).textTheme.titleLarge!.copyWith(
                                      color: Appcolor.base,
                                      fontSize: 17,
                                    )
                                  : Theme.of(
                                      context,
                                    ).textTheme.titleLarge!.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[500],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
