import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/core/function/confirmationAlert.dart';
import 'package:clinik_app/core/function/openLink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                'هل تريد بالتأكيد تسجيل الخروج ؟',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () => launchCompanyUrl('https://phoenitech.sy/ar'),
              child: Row(
                children: [
                  Image.asset(Appimages.team, width: 30),
                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'تطوير شركة فوني تيك التقنية - سورية',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        color: Appcolor.base,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => launchCompanyUrl('https://wa.me/963935614823'),
                    child: SvgPicture.asset(
                      Appimages.whatsapp,
                      height: 20,
                      width: 20,
                      color: Appcolor.bas2,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => launchCompanyUrl(
                      'https://www.instagram.com/phoeni.tech',
                    ),
                    child: SvgPicture.asset(
                      Appimages.instagram,
                      height: 20,
                      width: 20,
                      color: Appcolor.bas2,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => launchCompanyUrl('https://x.com/phoeni_tech'),
                    child: SvgPicture.asset(
                      Appimages.x,
                      height: 20,
                      width: 20,
                      color: Appcolor.bas2,
                    ),
                  ),

                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => launchCompanyUrl(
                      'https://www.facebook.com/PhoeniTech.sy',
                    ),
                    child: SvgPicture.asset(
                      Appimages.facebook,
                      height: 20,
                      width: 20,
                      color: Appcolor.bas2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
