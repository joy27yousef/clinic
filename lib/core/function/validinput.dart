class FieldsValidator {
  FieldsValidator._();
  static String? validatePassword({required String password}) {
    String errorMessage = "";
    if (password.isEmpty) {
      return "لا يمكن أن يكون الحقل فارغاً";
    }
    if (password.length < 8) {
      errorMessage += 'لا يمكن ان يكون أقل من 8 حروف';
    }
    // if (!password.contains(RegExp(r'[A-Z]'))) {
    //   errorMessage += 'Uppercase letter is missing.\n';
    // }
    // if (!password.contains(RegExp(r'[a-z]'))) {
    //   errorMessage += 'Lowercase letter is missing.\n';
    // }
    // if (!password.contains(RegExp(r'[0-9]'))) {
    //   errorMessage += 'Digit is missing.\n';
    // }
    // if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
    //   errorMessage += 'Special character is missing.\n';
    // }
    return errorMessage.isEmpty ? null : errorMessage;
  }

  static String? validateEmail(String s, {required String email}) {
    if (email.isEmpty) {
      return "لا يمكن أن يكون الحقل فارغاً";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return "البريد الاكتروني غير صحيح";
    }
    return null;
  }

  static String? matchPassword({
    required String value1,
    required String value2,
    String validMessage = "كلمة المرور غير متطابقة",
    required String password,
  }) {
    if (value1.trim() != value2.trim() || value1.isEmpty || value2.isEmpty) {
      return validMessage;
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "لا يمكن أن يكون الحقل فارغاً";
    }
    return null;
  }
}
