class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    String message = '';
    if (jsonData['messages'] is String) {
      message = jsonData['messages'];
    } else if (jsonData['messages'] is List) {
      message = (jsonData['messages'] as List).join('\n');
    } else {
      message = 'حدث خطأ غير معروف';
    }

    int statusInt;
    if (jsonData['status'] is int) {
      statusInt = jsonData['status'];
    } else if (jsonData['status'] is bool) {
      statusInt = (jsonData['status'] as bool) ? 200 : 400;
    } else {
      statusInt = 500;
    }

    return ErrorModel(status: statusInt, errorMessage: message);
  }
}
