import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:flutter/material.dart';

class WelcomePart extends StatelessWidget {
  final Color containerColor;
  final Color textColor;
  const WelcomePart({
    super.key,
    required this.containerColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 175,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'حتى ولو نزل العالم كلّه مستحسناً، مستجيراً لما ضيّق على الكنيسة المقدّسة ولا أنضب كنوز الله التي لا تنضب',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'القدّيس يوحنّا الرحيم',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(Appimages.icon1),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
