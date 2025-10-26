import 'package:clinik_app/controllers/auth/authController.dart';

import 'package:clinik_app/views/screens/login/widget/inputs.dart';
import 'package:clinik_app/views/screens/login/widget/logoimage.dart';
import 'package:clinik_app/views/screens/login/widget/welcomeText.dart';
import 'package:clinik_app/views/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  AuthController controller = Get.find();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            LogoImage(),
            WelcomeText(),
            Inputs(),
            BoxText(
              textin: 'تسجيل الدخول',
              onTapFun: () {
                controller.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
