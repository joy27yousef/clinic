class ChangePasswordModel {
  final bool status;
  final dynamic data;
  final String messages;
  final int code;

  ChangePasswordModel({
    required this.status,
    this.data,
    required this.messages,
    required this.code,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'] ?? false,
      data: json['data'],
      messages: json['messages'] ?? '',
      code: json['code'] ?? 0,
    );
  }
}
