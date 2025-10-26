class LoginModel {
  final bool status;
  final LoginData? data;
  final String? messages;
  final int? code;

  LoginModel({required this.status, this.data, this.messages, this.code});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
      messages: json['messages'],
      code: json['code'],
    );
  }
}

class LoginData {
  final User? user;
  final String? token;

  LoginData({this.user, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String userName;
  final String phone;
  final bool verified;
  final String? status;
  final String? emailVerifiedAt;
  final String? vCode;
  final String? deletedAt;
  final String createdAt;
  final String updatedAt;
  final List<Role> roles;
  final Doctor? doctor; // <-- الحقل الجديد

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.phone,
    required this.verified,
    this.status,
    this.emailVerifiedAt,
    this.vCode,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    this.doctor,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userName: json['user_name'],
      phone: json['phone'],
      verified: json['verified'] ?? false,
      status: json['status'],
      emailVerifiedAt: json['email_verified_at'],
      vCode: json['v_code'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => Role.fromJson(e))
              .toList() ??
          [],
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
    );
  }
}

class Role {
  final String id;
  final String name;
  final String nameAr;
  final String? displayName;
  final String? displayNameAr;
  final String description;
  final String? descriptionAr;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final Pivot? pivot;

  Role({
    required this.id,
    required this.name,
    required this.nameAr,
    this.displayName,
    this.displayNameAr,
    required this.description,
    this.descriptionAr,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      displayName: json['display_name'],
      displayNameAr: json['display_name_ar'],
      description: json['description'],
      descriptionAr: json['description_ar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }
}

class Pivot {
  final String userId;
  final String roleId;

  Pivot({required this.userId, required this.roleId});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(userId: json['user_id'], roleId: json['role_id']);
  }
}

class Doctor {
  final String id;
  final String userId;

  Doctor({required this.id, required this.userId});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      userId: json['user_id'],
    );
  }
}
