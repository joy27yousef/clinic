import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:clinik_app/core/function/confirmationAlert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

class OpenDrawer extends StatelessWidget {
  AuthController controller = Get.find();
  OpenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Appimages.icon2),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(200)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'فرقة القدّيس يوحنّا الرحيم',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 17),
        ),
        SizedBox(height: 30),
        ListTile(
          title: Text(
            'تواصل معنا',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          leading: Icon(Iconsax.mobile),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTile(
          onTap: () {
            confirmationAelrt(
              Appimages.logout,
              'هل أنت واثق من  أنك تريد تسجيل الخروج من التطبيق ؟؟',
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
          leading: Icon(Iconsax.logout),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}
