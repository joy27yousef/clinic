import 'package:clinik_app/core/api/AppEndpoint.dart';

class LogoutModel {
  final bool status;
  final String? messages;
  final int? code;

  LogoutModel({required this.status, this.messages, this.code});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      status: json[ApiKey.status] ?? false,
      messages: json[ApiKey.messages],
      code: json[ApiKey.code],
    );
  }
}
