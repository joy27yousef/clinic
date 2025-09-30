import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void showLoadingDialog(String text) {
  FocusScope.of(Get.context!).unfocus();
  FocusManager.instance.primaryFocus?.unfocus();

  Get.dialog(
    Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            SizedBox(
              height: 150,   
              child: Lottie.asset(
                Appimages.loading,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(Get.context!)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4), 
  );
}
