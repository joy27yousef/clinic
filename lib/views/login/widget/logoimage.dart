import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          image: DecorationImage(
            image: AssetImage(Appimages.icon2),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(150)),
        ),
      ),
    );
  }
}
