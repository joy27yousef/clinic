import 'package:clinik_app/core/api/AppEndpoint.dart';

class MedicalRecordsStatsModel {
  final bool status;
  final MedicalRecordsStatsDataModel? data;
  final String? messages;
  final int? code;

  MedicalRecordsStatsModel({
    required this.status,
    this.data,
    this.messages,
    this.code,
  });

  factory MedicalRecordsStatsModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordsStatsModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? MedicalRecordsStatsDataModel.fromJson(json[ApiKey.data])
          : null,
      messages: json[ApiKey.messages],
      code: json[ApiKey.code],
    );
  }
}

class MedicalRecordsStatsDataModel {
  final int totalRecords;
  final int recordsToday;
  final int recordsThisWeek;
  final int recordsThisMonth;
  final int recordsWithDiagnosis;
  final int recordsWithTreatment;
  final int recordsWithPrescriptions;
  final int uniquePatients;
  final int uniqueDoctors;

  MedicalRecordsStatsDataModel({
    required this.totalRecords,
    required this.recordsToday,
    required this.recordsThisWeek,
    required this.recordsThisMonth,
    required this.recordsWithDiagnosis,
    required this.recordsWithTreatment,
    required this.recordsWithPrescriptions,
    required this.uniquePatients,
    required this.uniqueDoctors,
  });

  factory MedicalRecordsStatsDataModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordsStatsDataModel(
      totalRecords: json['total_records'] ?? 0,
      recordsToday: json['records_today'] ?? 0,
      recordsThisWeek: json['records_this_week'] ?? 0,
      recordsThisMonth: json['records_this_month'] ?? 0,
      recordsWithDiagnosis: json['records_with_diagnosis'] ?? 0,
      recordsWithTreatment: json['records_with_treatment'] ?? 0,
      recordsWithPrescriptions: json['records_with_prescriptions'] ?? 0,
      uniquePatients: json['unique_patients'] ?? 0,
      uniqueDoctors: json['unique_doctors'] ?? 0,
    );
  }
}
