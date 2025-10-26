import 'package:clinik_app/core/constant/AppColor.dart';
import 'package:clinik_app/core/function/statusView.dart';
import 'package:clinik_app/core/function/viewMeetingDetails.dart';
import 'package:flutter/material.dart';

class MeetingCard extends StatelessWidget {
  final dynamic meeting;
  const MeetingCard({super.key, required this.meeting});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () {
        viewMeetingDetails(context, meeting);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meeting.dateOnly,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Appcolor.base,
                      ),
                    ),
                    Text(
                      meeting.timeOnly,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Appcolor.base,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  meeting.patientName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                SizedBox(
                  width: 200,
                  child: Text(
                    meeting.notes,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: meeting.status == "completed"
                      ? Colors.green.shade300
                      : meeting.status == "cancelled"
                      ? Colors.red.shade300
                      : meeting.status == "scheduled"
                      ? Colors.blue.shade300
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  viewStatus(meeting.status),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
