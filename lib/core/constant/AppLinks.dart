class Applinks {
  static const String server = 'https://clinicback.unocodetech.net/api';
  //auth
  static const String login = '$server/login';
  static const String logout = '$server/logoutFromAllTokens';
  //doctor
  static const String appointments = '$server/appointments';
  static const String doctors = '$server/doctors';
  static const String patients = '$server/patients';
  static const String records = '$server/medical-records-stats';
  static const String appointmentsStats = '$server/appointments-stats';
}
