import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/api/dioConsumer.dart';
import 'package:clinik_app/core/cache/cacheHelper.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppRoutes.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/function/customSnackBar.dart';
import 'package:clinik_app/core/function/loadindDialog.dart';
import 'package:clinik_app/core/repo/AppRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final AppRepository repo;
  final error = Rxn<ErrorModel>();

  Statusrequest statusrequest = Statusrequest.none;
  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;
  final box = GetStorage();

  @override
  void onInit() {
    repo = AppRepository(api: DioConsumer(dio: Dio()));
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  Future<void> login() async {
    if (formstate.currentState?.validate() ?? false) {
      statusrequest = Statusrequest.loading;
      update();

      showLoadingDialog('جاري تسجيل الدخول');
      var response = await repo.loginData(email.text, password.text);
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
        (loginModel) async {
          if (loginModel.status == true && loginModel.data != null) {
            if (Get.isDialogOpen ?? false) Get.back();

            final user = loginModel.data!.user;

            final roleName = user?.roles.isNotEmpty == true
                ? user!.roles.first.name
                : 'unknown';

            CacheHelper().removeData(key: GeneralKey.userRole);
            CacheHelper().saveData(key: GeneralKey.userRole, value: roleName);
            CacheHelper().removeData(key: GeneralKey.userName);
            CacheHelper().saveData(key: GeneralKey.userName, value: user!.name);
            email.clear();
            password.clear();
            if (roleName == 'admin') {
              Get.offNamed(AppRoutes.adminBasePage);
            } else if (roleName == 'doctor') {
              Get.offNamed(AppRoutes.doctorBasePage);
            } else {
              showCustomSnackbar(
                title: "فشل",
                message: loginModel.messages ?? "بيانات غير صحيحة",
                icon: Icons.error,
                backgroundColor: Colors.redAccent,
              );
            }

            showCustomSnackbar(
              title: "أهلاً وسهلاً بك",
              message: loginModel.messages ?? "تم تسجيل الدخول بنجاح ✅",
              icon: Icons.login_rounded,
              backgroundColor: Appcolor.base,
            );
          } else {
            if (Get.isDialogOpen ?? false) Get.back();
            showCustomSnackbar(
              title: "فشل",
              message: loginModel.messages ?? "بيانات غير صحيحة",
              icon: Icons.error,
              backgroundColor: Colors.redAccent,
            );
          }
        },
      );

      update();
    }
  }

  Future<void> logout() async {
    statusrequest = Statusrequest.loading;
    update();

    showLoadingDialog('جاري تسجيل الخروج');
    var response = await repo.logoutData();
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
      (logoutModel) async {
        if (logoutModel.status == true) {
          if (Get.isDialogOpen ?? false) Get.back();
          Get.offAllNamed(AppRoutes.login);

          showCustomSnackbar(
            title: "إلى اللقاء",
            message: logoutModel.messages ?? "تم تسجيل الخروج بنجاح ✅",
            icon: Icons.logout_outlined,
            backgroundColor: Appcolor.base,
          );
        } else {
          if (Get.isDialogOpen ?? false) Get.back();
          showCustomSnackbar(
            title: "فشل",
            message: logoutModel.messages ?? "بيانات غير صحيحة",
            icon: Icons.error,
            backgroundColor: Colors.redAccent,
          );
        }
      },
    );

    update();
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
}
