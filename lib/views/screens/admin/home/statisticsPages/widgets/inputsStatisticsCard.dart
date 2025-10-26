// import 'package:clinik_app/controllers/admin/inoutStatisticsController.dart';
// import 'package:clinik_app/core/constant/AppColor.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InputsstatiSticsCard extends StatelessWidget {
//   InputsstatiSticsCard({super.key});
//   InoutStatisticsController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     List fee = [controller.avgFee, controller.maxFee, controller.minFee];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: controller.title.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 15,
//             mainAxisSpacing: 15,
//             childAspectRatio: 1.2,
//           ),
//           itemBuilder: (context, i) => Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.shade100,
//                   blurStyle: BlurStyle.outer,
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     color: Appcolor.bas2,
//                     borderRadius: const BorderRadius.all(Radius.circular(40)),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1000',
//                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   controller.title[i],
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontSize: 17,
//                     fontWeight: FontWeight.normal,
//                     color: Appcolor.bas2,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 20),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: controller.title2.length,
//           itemBuilder: (context, i) => Container(
//             height: 70,
//             margin: const EdgeInsets.symmetric(vertical: 5),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   controller.title2[i],
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontWeight: FontWeight.normal,
//                     color: Appcolor.bas2,
//                     fontSize: 17,
//                   ),
//                 ),
//                 Container(
//                   height: 40,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     color: Appcolor.bas2,
//                     borderRadius: const BorderRadius.all(Radius.circular(30)),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "${fee[i]}",
//                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//       ],
//     );
//   }
// }
