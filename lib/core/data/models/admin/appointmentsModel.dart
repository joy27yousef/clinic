import 'package:clinik_app/core/api/AppEndpoint.dart';

class AppointmentsStatsModel {
  final bool status;
  final AppointmentsStatsDataModel? data;
  final String? messages;
  final int? code;

  AppointmentsStatsModel({
    required this.status,
    this.data,
    this.messages,
    this.code,
  });

  factory AppointmentsStatsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsStatsModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? AppointmentsStatsDataModel.fromJson(json[ApiKey.data])
          : null,
      messages: json[ApiKey.messages],
      code: json[ApiKey.code],
    );
  }
}

class AppointmentsStatsDataModel {
  final int totalAppointments;
  final int scheduledAppointments;
  final int completedAppointments;
  final int cancelledAppointments;
  final int unassignedAppointments;
  final int assignedAppointments;
  final int todayAppointments;
  final int upcomingAppointments;
  final int overdueAppointments;

  AppointmentsStatsDataModel({
    required this.totalAppointments,
    required this.scheduledAppointments,
    required this.completedAppointments,
    required this.cancelledAppointments,
    required this.unassignedAppointments,
    required this.assignedAppointments,
    required this.todayAppointments,
    required this.upcomingAppointments,
    required this.overdueAppointments,
  });

  factory AppointmentsStatsDataModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsStatsDataModel(
      totalAppointments: json[ApiKey.totalAppointments] ?? 0,
      scheduledAppointments: json[ApiKey.scheduledAppointments] ?? 0,
      completedAppointments: json[ApiKey.completedAppointments] ?? 0,
      cancelledAppointments: json[ApiKey.cancelledAppointments] ?? 0,
      unassignedAppointments: json[ApiKey.unassignedAppointments] ?? 0,
      assignedAppointments: json[ApiKey.assignedAppointments] ?? 0,
      todayAppointments: json[ApiKey.todayAppointments] ?? 0,
      upcomingAppointments: json[ApiKey.upcomingAppointments] ?? 0,
      overdueAppointments: json[ApiKey.overdueAppointments] ?? 0,
    );
  }
}
