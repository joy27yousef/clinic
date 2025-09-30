import 'package:clinik_app/controllers/doctor/calendarController.dart';
import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/statusView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void viewMeetingDetails(BuildContext context, Meeting meeting) {
  Get.dialog(
    AlertDialog(
      title: Text(
        "تفاصيل الموعد",
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
      ),
      content: ListView(
        children: [
          Text(
            'اسم المريض: ',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolor.base,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            meeting.patientName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 15),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'اليوم:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Appcolor.base,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Text(
                meeting.dateOnly,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'الساعة: ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Appcolor.base,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Text(
                meeting.timeOnly,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'الحالة: ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Appcolor.base,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Text(
                viewStatus(meeting.status),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'الأجر: ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Appcolor.base,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Text(
                meeting.fee,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'الملاحظات: ',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolor.base,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            meeting.notes,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 15),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "إغلاق",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Appcolor.base),
          ),
        ),
      ],
    ),
  );
}
