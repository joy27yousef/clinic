import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/function/customSnackBar.dart';
import 'package:clinik_app/core/function/loadindDialog.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final AppRepository repo;
  final error = Rxn<ErrorModel>();

  Statusrequest statusrequest = Statusrequest.none;
  @override
  void onInit() {
    repo = AppRepository(api: DioConsumer(dio: Dio()));

    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  Future<void> changePassword() async {
    if (formstate.currentState?.validate() ?? false) {
      statusrequest = Statusrequest.loading;
      update();

      showLoadingDialog('جاري الحفظ');
      var response = await repo.changePasswordData(
        password.text,
        confirmPassword.text,
      );
      update();

      response.fold(
        (failure) {
          if (Get.isDialogOpen ?? false) Get.back();
          showCustomSnackbar(
            title: "خطأ",
            message: "فشل الاتصال بالسيرفر",
            icon: Icons.error,
            backgroundColor: Colors.redAccent,
          );
        },
        (data) async {
          if (data.status == true) {
            if (Get.isDialogOpen ?? false) Get.back();
            Get.back();
            showCustomSnackbar(
              title: "نجاح",
              message: data.messages ?? "يمكنك استخدام الكلمة الجديدة الآن",
              icon: Icons.done,
              backgroundColor: Appcolor.base,
            );
          } else {
            if (Get.isDialogOpen ?? false) Get.back();
            showCustomSnackbar(
              title: "فشل",
              message: data.messages ?? "بيانات غير صحيحة",
              icon: Icons.error,
              backgroundColor: Colors.redAccent,
            );
          }
        },
      );

      update();
    }
  }
}
