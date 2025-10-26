import 'dart:convert';

import 'package:clinik_app/core/api/AppEndpoint.dart';
import 'package:clinik_app/core/api/apiConsumer.dart';
import 'package:clinik_app/core/cache/cacheHelper.dart';
import 'package:clinik_app/core/data/models/admin/appointmentsModel.dart';
import 'package:clinik_app/core/data/models/admin/doctorListModel.dart';
import 'package:clinik_app/core/data/models/admin/patientsModel.dart';
import 'package:clinik_app/core/data/models/admin/recordModel.dart';
import 'package:clinik_app/core/data/models/admin/reports/appointmentsRevenue.dart';
import 'package:clinik_app/core/data/models/admin/reports/comprehensiveReport.dart';
import 'package:clinik_app/core/data/models/admin/reports/monthluReports.dart';
import 'package:clinik_app/core/data/models/auth/loginModel.dart';
import 'package:clinik_app/core/data/models/auth/logoutModel.dart';
import 'package:clinik_app/core/data/models/doctor/doctorScheduleModel.dart';
import 'package:clinik_app/core/errors/errorModel.dart';
import 'package:clinik_app/core/errors/serverException.dart';
import 'package:dartz/dartz.dart';

class AppRepository {
  final ApiConsumer api;
  AppRepository({required this.api});
  // Future<Either<ErrorModel, LoginModel>> loginData(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     final response = await api.post(
  //       AppEndpoint.login,
  //       data: {ApiKey.identifier: email, ApiKey.password: password},
  //       withToken: false,
  //     );
  //     // final userLogin = LoginModel.fromJson(response);
  //     final userLogin = LoginModel.fromJson(response);

  //     print('hiiiiiiiiiiiiiiiiiiiiiiiiiiii');

  //     CacheHelper().removeData(key: GeneralKey.token);
  //     CacheHelper().removeData(key: GeneralKey.userName);
  //     CacheHelper().removeData(key: GeneralKey.userId);
  //     CacheHelper().saveData(
  //       key: GeneralKey.token,
  //       value: userLogin.data!.token,
  //     );
  //     CacheHelper().saveData(
  //       key: GeneralKey.userId,
  //       value: userLogin.data!.user!.id,
  //     );
  //     CacheHelper().saveData(
  //       key: GeneralKey.userName,
  //       value: userLogin.data!.user!.name,
  //     );

  //     return Right(userLogin);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel);
  //   } catch (e) {
  //     return Left(ErrorModel(status: 500, errorMessage: e.toString()));
  //   }
  // }
  Future<Either<ErrorModel, LoginModel>> loginData(
    String email,
    String password,
  ) async {
    try {
      final response = await api.post(
        AppEndpoint.login,
        data: {ApiKey.identifier: email, ApiKey.password: password},
        withToken: false,
      );

      // --- Debug: Print raw response ---
      print('--- RAW RESPONSE ---');
      print(response);
      print('--- RESPONSE TYPE: ${response.runtimeType} ---');

      // --- Ensure response is Map<String, dynamic> ---
      Map<String, dynamic> dataMap;
      if (response is String) {
        dataMap = jsonDecode(response);
      } else if (response is Map<String, dynamic>) {
        dataMap = response;
      } else if (response) {
        // in case using Dio directly
        dataMap = response.data is String
            ? jsonDecode(response.data)
            : response.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected response type: ${response.runtimeType}');
      }

      // --- Parse JSON to LoginModel ---
      final userLogin = LoginModel.fromJson(dataMap);
      print('--- Parsed LoginModel ---');
      print('Status: ${userLogin.status}');
      print('Token: ${userLogin.data?.token}');
      print('User Name: ${userLogin.data?.user?.name}');

      // --- Save token and user info ---
      CacheHelper().removeData(key: GeneralKey.token);
      CacheHelper().removeData(key: GeneralKey.userId);
      CacheHelper().removeData(key: GeneralKey.userName);

      if (userLogin.data != null && userLogin.data!.user != null) {
        CacheHelper().saveData(
          key: GeneralKey.token,
          value: userLogin.data!.token,
        );
        CacheHelper().saveData(
          key: GeneralKey.userId,
          value: userLogin.data!.user!.doctor?.id,
        );
        CacheHelper().saveData(
          key: GeneralKey.userName,
          value: userLogin.data!.user!.name,
        );
        print('${userLogin.data!.user!.name}');
      }

      return Right(userLogin);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      print('--- LOGIN ERROR ---');
      print(e.toString());
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, LogoutModel>> logoutData() async {
    try {
      final response = await api.get(AppEndpoint.logout);
      final userLogout = LogoutModel.fromJson(response);
      CacheHelper().removeData(key: GeneralKey.token);
      CacheHelper().removeData(key: GeneralKey.userRole);
      CacheHelper().removeData(key: GeneralKey.userName);
      return Right(userLogout);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, AppointmentsStatsModel>>
  appointmentsStatsData() async {
    try {
      final response = await api.get(AppEndpoint.appointmentsStats);
      final stats = AppointmentsStatsModel.fromJson(response);
      return Right(stats);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, DoctorListModel>> doctorListdata() async {
    try {
      final response = await api.get(AppEndpoint.doctors);
      final doctors = DoctorListModel.fromJson(response);
      return Right(doctors);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, PatientListModel>> patientListData() async {
    try {
      final response = await api.get(AppEndpoint.patients);
      final patient = PatientListModel.fromJson(response);
      return Right(patient);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, MedicalRecordsStatsModel>> recordData() async {
    try {
      final response = await api.get(AppEndpoint.records);
      final record = MedicalRecordsStatsModel.fromJson(response);
      return Right(record);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, DoctorScheduleModel>> doctorScheduleData() async {
    try {
      final response = await api.get(
        '${AppEndpoint.appointments}?doctor_id=${CacheHelper().getDataString(key: GeneralKey.userId)}',
      );

      final doctor = DoctorScheduleModel.fromJson(response);
      return Right(doctor);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, AppointmentReportModel>> appointmentReportData({
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await api.get(
        AppEndpoint.appointmentReportModel,
        queryParameters: params,
      );

      final report = AppointmentReportModel.fromJson(response);
      return Right(report);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, ComprehensiveReportModel>> comprehensiveReportData({
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await api.get(
        AppEndpoint.comprehensiveReport,
        queryParameters: params,
      );

      final report = ComprehensiveReportModel.fromJson(response);
      return Right(report);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }

  Future<Either<ErrorModel, MonthlyProfitReportModel>> monthlyProfitReportData({
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await api.get(
        AppEndpoint.comprehensiveReport,
        queryParameters: params,
      );

      final report = MonthlyProfitReportModel.fromJson(response);
      return Right(report);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: 500, errorMessage: e.toString()));
    }
  }
}
