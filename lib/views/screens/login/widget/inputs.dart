import 'package:clinik_app/controllers/auth/authController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/validinput.dart';
import 'package:clinik_app/views/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Inputs extends StatelessWidget {
  AuthController controller = Get.find();
  Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formstate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' اسم المستخدم',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 15),
          TextFormGen(
            hint: 'البريد أو اسم المستخدم',
            lable: 'ادخل بريدك أو اسمك',
            iconform: Icon(Icons.email_rounded, color: Appcolor.base),
            typekey: TextInputType.emailAddress,
            mycontroller: controller.email,
            valid: (value) => FieldsValidator.validateEmpty(value ?? ''),
          ),
          SizedBox(height: 15),
          Text(
            'كلمة المرور',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 15),
          GetBuilder<AuthController>(
            builder: (controller) => TextFormGen(
              valid: (value) =>
                  FieldsValidator.validatePassword(password: value ?? ''),
              hint: 'كلمة المرور',
              lable: 'ادخل كملة المرور',
              iconform: Icon(
                controller.isShowPassword
                    ? FontAwesomeIcons.solidEyeSlash
                    : FontAwesomeIcons.solidEye,
                color: Appcolor.base,
                size: 20,
              ),
              mycontroller: controller.password,
              typekey: TextInputType.name,
              obscureText: controller.isShowPassword,
              onTapicon: () {
                controller.showPassword();
              },
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
