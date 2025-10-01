import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/constant/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Handilingdataview extends StatelessWidget {
  final List<Statusrequest> statusrequests;
  final Widget widget;

  const Handilingdataview({
    super.key,
    required this.statusrequests,
    required this.widget,
  });

  bool allSuccess() {
    return statusrequests.every((status) => status == Statusrequest.success);
  }

  Statusrequest firstNonSuccess() {
    return statusrequests.firstWhere(
      (status) => status != Statusrequest.success,
      orElse: () => Statusrequest.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (allSuccess()) {
      return widget;
    }

    final currentStatus = firstNonSuccess();

    switch (currentStatus) {
      case Statusrequest.loading:
        return Skeletonizer(enabled: true, child: widget);

      case Statusrequest.offlinefailure:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Appimages.offline, width: 120),
              const SizedBox(height: 16),
              Text(
                "أنت غير متصل بالإنترنت",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );

      case Statusrequest.serverfailure:
        return const Center(child: Text('Server failure ❌'));

      case Statusrequest.serverException:
        return const Center(child: Text('Unexpected error ⚠️'));

      case Statusrequest.failure:
        return Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Appcolor.base, width: 5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: Image.asset(Appimages.logo, width: 120)),
                Text(
                  'No Data Found',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );

      case Statusrequest.paymentRequired:
        return const Center(child: Text("Payment Required ❌"));

      default:
        return widget;
    }
  }
}
