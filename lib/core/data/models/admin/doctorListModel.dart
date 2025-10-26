import 'package:clinik_app/core/api/AppEndpoint.dart';

class DoctorListModel {
  final bool status;
  final DoctorListDataModel? data;
  final String? messages;
  final int? code;

  DoctorListModel({required this.status, this.data, this.messages, this.code});

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? DoctorListDataModel.fromJson(json[ApiKey.data])
          : null,
      messages: json[ApiKey.messages],
      code: json[ApiKey.code],
    );
  }
}

class DoctorListDataModel {
  final List<DoctorModel> doctors;
  final int? total;

  DoctorListDataModel({required this.doctors, this.total});

  factory DoctorListDataModel.fromJson(Map<String, dynamic> json) {
    return DoctorListDataModel(
      doctors:
          (json[ApiKey.data] as List<dynamic>?)
              ?.map((e) => DoctorModel.fromJson(e))
              .toList() ??
          [],
      total: json[ApiKey.total],
    );
  }
}

class DoctorModel {
  final String? id;
  final String? name;
  final String? specialization;
  final String? phone;
  final String? bio;
  final String? userId;
  final String? consultationFee;
  final bool? isAvailable;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  DoctorModel({
    this.id,
    this.name,
    this.specialization,
    this.phone,
    this.bio,
    this.userId,
    this.consultationFee,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      specialization: json[ApiKey.specialization],
      phone: json[ApiKey.phone],
      bio: json[ApiKey.bio],
      userId: json[ApiKey.userId],
      consultationFee: json[ApiKey.consultationfee]?.toString(),
      isAvailable: json[ApiKey.isavailable],
      createdAt: json[ApiKey.createdAt],
      updatedAt: json[ApiKey.updatedAt],
      deletedAt: json[ApiKey.deletedAt],
    );
  }
}
