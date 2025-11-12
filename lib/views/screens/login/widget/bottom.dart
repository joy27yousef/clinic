import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:clinik_app/core/function/openLink.dart';
import 'package:clinik_app/views/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Bottom extends StatelessWidget {
  Bottom({super.key});
  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoxText(
          textin: 'تسجيل الدخول',
          onTapFun: () {
            controller.login();
          },
        ),
        SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => launchCompanyUrl('https://phoenitech.sy/ar'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Appimages.team, width: 25),
                SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    'تطوير شركة فوني تيك التقنية - سورية',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15,
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
          padding: const EdgeInsets.symmetric(horizontal: 100),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => launchCompanyUrl('https://wa.me/963935614823'),
                child: SvgPicture.asset(
                  Appimages.whatsapp,
                  height: 18,
                  width: 18,
                  color: Appcolor.bas2,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () =>
                    launchCompanyUrl('https://www.instagram.com/phoeni.tech'),
                child: SvgPicture.asset(
                  Appimages.instagram,
                  height: 18,
                  width: 18,
                  color: Appcolor.bas2,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => launchCompanyUrl('https://x.com/phoeni_tech'),
                child: SvgPicture.asset(
                  Appimages.x,
                  height: 18,
                  width: 18,
                  color: Appcolor.bas2,
                ),
              ),

              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () =>
                    launchCompanyUrl('https://www.facebook.com/PhoeniTech.sy'),
                child: SvgPicture.asset(
                  Appimages.facebook,
                  height: 18,
                  width: 18,
                  color: Appcolor.bas2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
