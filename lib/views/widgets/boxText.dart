import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';

class BoxText extends StatelessWidget {
  final void Function()? onTapFun;
  final String textin;
  const BoxText({super.key, this.onTapFun, required this.textin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFun,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 3, color: Appcolor.baselight)],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Appcolor.base,
        ),
        child: Center(
          child: Text(
            textin,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
