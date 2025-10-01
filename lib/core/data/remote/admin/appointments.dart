import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppLinks.dart';
import 'package:dartz/dartz.dart';

class AppointmentsStatsData {
  final Crud crud;

  AppointmentsStatsData({required this.crud});

  Future<Either<Statusrequest, dynamic>> getData() async {
    return await crud.getRequest(Applinks.appointmentsStats, withToken: true);
  }
}
