import 'package:clinik_app/controllers/changePassController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/validinput.dart';
import 'package:clinik_app/views/widgets/TextFormGen.dart';
import 'package:clinik_app/views/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangePassPage extends StatelessWidget {
  ChangePassController controller = Get.find();
  ChangePassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تغيير كلمة المرور'),
        leadingWidth: 50,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Form(
        key: controller.formstate,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 20,
            left: 20,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'كلمة المرور الجديدة',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: '********',
                iconform: Icon(Iconsax.password_check, color: Appcolor.base),
                mycontroller: controller.password,
                typekey: TextInputType.text,
                valid: (value) =>
                    FieldsValidator.validatePassword(password: value ?? ''),
              ),
              SizedBox(height: 20),
              Text(
                'تأكيد كلمة المرور',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: '********',
                iconform: Icon(Iconsax.password_check, color: Appcolor.base),
                mycontroller: controller.confirmPassword,
                typekey: TextInputType.text,
                valid: (value) => FieldsValidator.matchPassword(
                  value1: controller.password.text,
                  value2: value ?? '',
                  password: controller.password.text,
                ),
              ),

              Spacer(),
              BoxText(
                textin: "حفظ التغيرات",
                onTapFun: () {
                  controller.changePassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
