import 'package:get_storage/get_storage.dart';

final box = GetStorage();

Future<void> saveToken(String token) async {
  await box.remove('token');
  await box.write('token', token);
}

String? getToken() {
  return box.read('token');
}

Future<void> clearToken() async {
  await box.remove('token');
}
