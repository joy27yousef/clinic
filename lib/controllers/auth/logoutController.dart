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

class LogoutController extends GetxController {
  LogoutData logoutData = LogoutData(crud: Get.find<Crud>());

  Statusrequest statusrequest = Statusrequest.none;

  @override
  void onInit() {
    super.onInit();
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
