import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppLinks.dart';
import 'package:dartz/dartz.dart';

class AppointmentsData {
  final Crud crud;

  AppointmentsData({required this.crud});

  Future<Either<Statusrequest, dynamic>> getData({
    required String doctorId,
    String? past,
    String? thisWeek,
    String? tomorrow,
    String? today,
    Map<String, dynamic>? extraParams,
  }) async {
    final queryParameters = <String, dynamic>{};
    queryParameters['doctor_id'] = doctorId;

    if (past != null) queryParameters['past'] = past;
    if (thisWeek != null) queryParameters['this_week'] = thisWeek;
    if (tomorrow != null) queryParameters['tomorrow'] = tomorrow;
    if (today != null) queryParameters['today'] = today;

    if (extraParams != null) {
      queryParameters.addAll(extraParams);
    }

    return await crud.getRequest(
      Applinks.appointments,
      withToken: true,
      queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
    );
  }
}
