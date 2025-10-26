import 'package:clinik_app/core/api/AppEndpoint.dart';

class PatientListModel {
  final bool status;
  final PatientListDataModel? data;
  final String? messages;
  final int? code;

  PatientListModel({required this.status, this.data, this.messages, this.code});

  factory PatientListModel.fromJson(Map<String, dynamic> json) {
    return PatientListModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? PatientListDataModel.fromJson(json[ApiKey.data])
          : null,
      messages: json[ApiKey.messages],
      code: json[ApiKey.code],
    );
  }
}

class PatientListDataModel {
  final int? total;

  PatientListDataModel({this.total});

  factory PatientListDataModel.fromJson(Map<String, dynamic> json) {
    return PatientListDataModel(total: json[ApiKey.total]);
  }
}

// class PatientModel {
//   final String? id;
//   final String? userId;
//   final String? medicalRecordNumber;
//   final String? firstName;
//   final String? fatherName;
//   final String? motherName;
//   final String? familyName;
//   final String? fullName;
//   final String? nationality;
//   final String? gender;
//   final String? nationalId;
//   final bool? isActive;
//   final String? accountType;
//   final String? createdAt;
//   final String? updatedAt;
//   final Map<String, dynamic>? user;

//   PatientModel({
//     this.id,
//     this.userId,
//     this.medicalRecordNumber,
//     this.firstName,
//     this.fatherName,
//     this.motherName,
//     this.familyName,
//     this.fullName,
//     this.nationality,
//     this.gender,
//     this.nationalId,
//     this.isActive,
//     this.accountType,
//     this.createdAt,
//     this.updatedAt,
//     this.user,
//   });

//   factory PatientModel.fromJson(Map<String, dynamic> json) {
//     return PatientModel(
//       id: json[ApiKey.id],
//       userId: json[ApiKey.userId],
//       medicalRecordNumber: json['medical_record_number'],
//       firstName: json['first_name'],
//       fatherName: json['father_name'],
//       motherName: json['mother_name'],
//       familyName: json['family_name'],
//       fullName: json['full_name'],
//       nationality: json['nationality'],
//       gender: json['gender'],
//       nationalId: json['national_id'],
//       isActive: json['is_active'],
//       accountType: json['account_type'],
//       createdAt: json[ApiKey.createdAt],
//       updatedAt: json[ApiKey.updatedAt],
//       user: json[ApiKey.user] != null ? Map<String, dynamic>.from(json[ApiKey.user]) : null,
//     );
//   }
// }
