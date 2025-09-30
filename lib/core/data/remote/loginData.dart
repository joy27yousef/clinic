import 'package:clinik_app/core/class/crud.dart';
import 'package:clinik_app/core/class/statusRequest.dart';
import 'package:clinik_app/core/constant/AppLinks.dart';
import 'package:dartz/dartz.dart';

class LoginData {
  final Crud crud;

  LoginData({required this.crud});

  Future<Either<Statusrequest, dynamic>> getData(
    String email,
    String password,
  ) async {
    return await crud.postRequest(Applinks.login, {
      "identifier": email,
      "password": password,
    }, withToken: false);
  }
}

class LogoutData {
  final Crud crud;

  LogoutData({required this.crud});

  Future<Either<Statusrequest, dynamic>> getData() async {
    return await crud.getRequest(Applinks.logout, withToken: true);
  }
}
