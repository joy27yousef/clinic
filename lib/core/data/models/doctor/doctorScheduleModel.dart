import 'package:clinik_app/core/api/AppEndpoint.dart';

class DoctorScheduleModel {
  final bool status;
  final DoctorScheduleData? data;
  final String? messages;
  final int? code;

  DoctorScheduleModel({
    required this.status,
    this.data,
    this.messages,
    this.code,
  });

  factory DoctorScheduleModel.fromJson(Map<String, dynamic> json) {
    return DoctorScheduleModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? DoctorScheduleData.fromJson(json[ApiKey.data])
          : null,
      messages: json[ApiKey.messages],
      code: json[ApiKey.code],
    );
  }
}

class DoctorScheduleData {
  final int? currentPage;
  final List<Appointment> appointments;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  DoctorScheduleData({
    this.currentPage,
    required this.appointments,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory DoctorScheduleData.fromJson(Map<String, dynamic> json) {
    return DoctorScheduleData(
      currentPage: json['current_page'],
      appointments: json['data'] != null
          ? List<Appointment>.from(
              json['data'].map((x) => Appointment.fromJson(x)),
            )
          : [],
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: json['links'] != null
          ? List<Link>.from(json['links'].map((x) => Link.fromJson(x)))
          : [],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'] is String
          ? int.tryParse(json['per_page'])
          : json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}

class Appointment {
  final String? id;
  final String? patientId;
  final String? doctorId;
  final String? appointmentDate;
  final String? bookingSource;
  final String? appointmentTime;
  final String? reason;
  final String? createdBy;
  final String? status;
  final String? notes;
  final bool? isPaid;
  final String? paidAmount;
  final String? fee;
  final String? createdAt;
  final String? updatedAt;
  final Patient? patient;
  final DoctorUser? doctor;
  final Creator? creator;

  Appointment({
    this.id,
    this.patientId,
    this.doctorId,
    this.appointmentDate,
    this.bookingSource,
    this.appointmentTime,
    this.reason,
    this.createdBy,
    this.status,
    this.notes,
    this.isPaid,
    this.paidAmount,
    this.fee,
    this.createdAt,
    this.updatedAt,
    this.patient,
    this.doctor,
    this.creator,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      appointmentDate: json['appointment_date'],
      bookingSource: json['booking_source'],
      appointmentTime: json['appointment_time'],
      reason: json['reason'],
      createdBy: json['created_by'],
      status: json['status'],
      notes: json['notes'],
      isPaid: json['is_paid'],
      paidAmount: json['paid_amount'],
      fee: json['fee'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      patient:
          json['patient'] != null ? Patient.fromJson(json['patient']) : null,
      doctor: json['doctor'] != null ? DoctorUser.fromJson(json['doctor']) : null,
      creator:
          json['creator'] != null ? Creator.fromJson(json['creator']) : null,
    );
  }
}

class DoctorUser {
  final String? id;
  final String? name;
  final String? specialization;
  final String? phone;
  final String? email;
  final String? bio;
  final String? userId;
  final String? consultationFee;
  final bool? isAvailable;
  final String? createdAt;
  final String? updatedAt;

  DoctorUser({
    this.id,
    this.name,
    this.specialization,
    this.phone,
    this.email,
    this.bio,
    this.userId,
    this.consultationFee,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorUser.fromJson(Map<String, dynamic> json) {
    return DoctorUser(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      phone: json['phone'],
      email: json['email'],
      bio: json['bio'],
      userId: json['user_id'],
      consultationFee: json['consultation_fee'],
      isAvailable: json['is_available'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Patient {
  final String? id;
  final String? fullName;
  final String? firstName;
  final String? fatherName;
  final String? motherName;
  final String? familyName;
  final String? gender;
  final String? phone;
  final String? mobile;
  final String? bloodType;
  final String? currentGovernorate;
  final bool? isActive;

  Patient({
    this.id,
    this.fullName,
    this.firstName,
    this.fatherName,
    this.motherName,
    this.familyName,
    this.gender,
    this.phone,
    this.mobile,
    this.bloodType,
    this.currentGovernorate,
    this.isActive,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      fullName: json['full_name'],
      firstName: json['first_name'],
      fatherName: json['father_name'],
      motherName: json['mother_name'],
      familyName: json['family_name'],
      gender: json['gender'],
      phone: json['phone'],
      mobile: json['mobile'],
      bloodType: json['blood_type'],
      currentGovernorate: json['current_governorate'],
      isActive: json['is_active'],
    );
  }
}

class Creator {
  final String? id;
  final String? name;
  final String? email;
  final String? userName;
  final String? phone;

  Creator({
    this.id,
    this.name,
    this.email,
    this.userName,
    this.phone,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userName: json['user_name'],
      phone: json['phone'],
    );
  }
}
