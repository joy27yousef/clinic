import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/core/data/remote/loginData.dart';
import 'package:clinik_app/core/function/customSnackBar.dart';
import 'package:clinik_app/core/function/loadindDialog.dart';
import 'package:clinik_app/core/function/saveToken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  LoginData loginData = LoginData(crud: Get.find<Crud>());
  LogoutData logoutData = LogoutData(crud: Get.find<Crud>());

  Statusrequest statusrequest = Statusrequest.none;
  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;
  Map<String, dynamic> userData = {};
  final box = GetStorage();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  Future<void> login() async {
    if (formstate.currentState?.validate() ?? false) {
      statusrequest = Statusrequest.loading;
      update();

      showLoadingDialog('جاري تسجيل الدخول');

      var response = await loginData.getData(email.text, password.text);
      update();
      response.fold(
        (failure) {
          if (Get.isDialogOpen ?? false) Get.back();
          showCustomSnackbar(
            title: "خطأ",
            message: "فشل في السيرفر",
            icon: Icons.error,
            backgroundColor: Colors.redAccent,
          );
        },
        (data) async {
          if (data['status'] == true) {
            await saveToken(data['data']['token']);
            if (Get.isDialogOpen ?? false) Get.back();

            userData.clear();
            userData = Map<String, dynamic>.from(data['data']);
            await box.remove('userData');
            await box.write('userData', userData);
            await box.remove('role');
            await box.write('role', data['data']['user']['roles'][0]['name']);
            if (data['data']['user']['roles'][0]['name'] == 'admin') {
              Get.offAllNamed(AppRoutes.adminBasePage);
            } else if (data['data']['user']['roles'][0]['name'] == 'doctor') {
              Get.offAllNamed(AppRoutes.doctorBasePage);
            }

            showCustomSnackbar(
              title: "أهلاً وسهلاُ بك",
              message: data['messages'] ?? "تم تسجيل الدخول بنجاح ✅",
              icon: Icons.login_rounded,
              backgroundColor: Appcolor.base,
            );
          } else {
            if (Get.isDialogOpen ?? false) Get.back();
            showCustomSnackbar(
              title: "فشل",
              message: data['messages'] ?? "بيانات غير صحيحة",
              icon: Icons.error,
              backgroundColor: Colors.redAccent,
            );
          }
        },
      );

      update();
    }
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  Future<void> logout() async {
    statusrequest = Statusrequest.loading;
    update();

    showLoadingDialog('جاري تسجيل الخروج');

    var response = await logoutData.getData();
    update();
    response.fold(
      (failure) {
        if (Get.isDialogOpen ?? false) Get.back();
        showCustomSnackbar(
          title: "خطأ",
          message: "تعذر الاتصال بالسيرفر",
          icon: Icons.error,
          backgroundColor: Colors.redAccent,
        );
      },
      (data) async {
        if (data['status'] == true) {
          await box.remove('token');
          await box.remove('role');
          await box.remove('userData');
          Get.offAllNamed(AppRoutes.login);
          showCustomSnackbar(
            title: "إلى اللقاء",
            message: data['messages'] ?? "تم تسجيل الخروج بنجاح ✅",
            icon: Icons.logout_outlined,
            backgroundColor: Appcolor.base,
          );
        } else {
          if (Get.isDialogOpen ?? false) Get.back();
          showCustomSnackbar(
            title: "فشل",
            message: data['messages'] ?? "بيانات غير صحيحة",
            icon: Icons.error,
            backgroundColor: Colors.redAccent,
          );
        }
      },
    );

    update();
  }
}
