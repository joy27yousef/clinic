import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SystemView extends StatelessWidget {
  SystemView({super.key});
  List icons = [
    FontAwesomeIcons.userDoctor,
    FontAwesomeIcons.hospital,
    FontAwesomeIcons.moneyBillTrendUp,
    FontAwesomeIcons.businessTime,
  ];
  List title = ['الأطباء', 'المرضى', 'الواردات', 'المواعيد'];
  List<VoidCallback> toPage = [
    () => Get.toNamed(AppRoutes.doctorsStatistics),
    () => Get.toNamed(AppRoutes.patientStatistics),
    () => Get.toNamed(AppRoutes.inputSatistics),
    () => Get.toNamed(AppRoutes.inputSatistics),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إحصائيات النظام',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 20),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: toPage[i],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0F7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFCBDCEB),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child: Icon(icons[i], color: Appcolor.bas2, size: 30),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      title[i],
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolor.bas2,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}
