import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          'أهلاً وسهلاً بك ..',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 5),
        Text(
          'الرجاء ادخال البريد الالكتروني وكلمة السرّ لتسجيل الدخول',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
