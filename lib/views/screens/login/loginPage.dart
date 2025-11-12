
import 'package:clinik_app/views/screens/login/widget/bottom.dart';

import 'package:clinik_app/views/screens/login/widget/inputs.dart';
import 'package:clinik_app/views/screens/login/widget/logoimage.dart';
import 'package:clinik_app/views/screens/login/widget/welcomeText.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [LogoImage(), WelcomeText(), Inputs(), Bottom()],
        ),
      ),
    );
  }
}
