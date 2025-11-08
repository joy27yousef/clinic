import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/core/function/confirmationAlert.dart';
import 'package:clinik_app/core/function/openLink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OpenDrawer extends StatelessWidget {
  final AuthController controller = Get.find();
  OpenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Appimages.icon2),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(200)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'فرقة القدّيس يوحنّا الرحيم',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 17),
          ),
          const SizedBox(height: 30),

          ListTile(
            title: Text(
              'تغيير كلمة المرور',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoutes.changePassPage);
            },
            leading: const Icon(Iconsax.password_check),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          // ListTile(
          //   title: Text(
          //     'تواصل معنا',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //       fontSize: 16,
          //       fontWeight: FontWeight.normal,
          //     ),
          //   ),
          //   leading: const Icon(Iconsax.mobile),
          //   trailing: const Icon(Icons.arrow_forward_ios_rounded),
          // ),
          ListTile(
            onTap: () {
              confirmationAelrt(
                Appimages.logout,
                'هل أنت واثق من أنك تريد تسجيل الخروج من التطبيق ؟؟',
                'كلا، البقاء',
                'نعم، سجّل الخروج',
                Appcolor.base,
                () {
                  controller.logout();
                },
              );
            },
            title: Text(
              'تسجيل الخروج',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            leading: const Icon(Iconsax.logout),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),

          Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: launchCompanyUrl,
            child: Image.asset(Appimages.team, width: 30),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: launchCompanyUrl,

              borderRadius: BorderRadius.circular(8),
              child: Text(
                'تطوير شركة اونوكود التقنية - الامارات العربية المتحدة',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 13,
                  color: Appcolor.bas2,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
