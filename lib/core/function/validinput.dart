import 'package:get/get.dart';

String? validInput(
  String val,
  int min,
  int max,
  String type, {
  String? compareWith,
}) {
  if (val.isEmpty) {
    return "لا يجب أن يكون الحقل فارغ";
  }

if (val.length < min) {
  return "يجب أن يكون طول الحقل $min حرفًا على الأقل";
}

if (val.length > max) {
  return "يجب ألا يزيد طول الحقل عن $max حرفًا";
}


  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "البريد الإلكتروني غير صالح";
    }
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "اسم المستخدم غير صالح";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم الهاتف غير صالح";
    }
  }

  if (type == "confirmPassword") {
    if (compareWith != null && val != compareWith) {
      return "كلمات المرور غير متطابقة";
    }
  }

  return null;
}
