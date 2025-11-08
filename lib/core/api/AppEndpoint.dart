class AppEndpoint {
  static const String server = 'https://xc2.unocodetech.net/api/';
  // static const String server = 'https://clinicback.unocodetech.net/api';

  //auth
  static const String login = '/login';
  static const String logout = '/logoutFromCurrentToken';
  static const String changePassword = '/changePassword';

  //doctor
  static const String appointments = '/appointments';
  static const String doctors = '/doctors';
  static const String patients = '/patients';
  static const String records = '/medical-records-stats';
  static const String appointmentsStats = '/appointments-stats';
  //reports
  static String appointmentReportModel =
      'financial-reports/appointments-revenue';
  static String comprehensiveReport = 'financial-reports/comprehensive';
  static String monthlyReport = 'financial-reports/monthly-profit';
}

class GeneralKey {
  static String token = 'token';
  static String userId = 'userId';
  static String userRole = 'userRole';
  static String userName = 'userName';
}

class ApiKey {
  // 🔹 General Response
  static String status = 'status';
  static String messages = 'messages';
  static String code = 'code';
  static String data = 'data';
  static String createdAt = 'created_at';
  static String updatedAt = 'updated_at';
  static String deletedAt = 'deleted_at';

  // 🔹 Auth
  static String identifier = 'identifier';
  static String password = 'password'; 
  static String conpassword = 'password_confirmation'; 
  static String token = 'token';
  static String user = 'user';

  static String total = 'total';
  static String consultationfee = 'consultation_fee';
  static String isavailable = 'is_available';

  // 🔹 User
  static String id = 'id';
  static String name = 'name';
  static String email = 'email';
  static String userName = 'user_name';
  static String phone = 'phone';
  static String emailVerifiedAt = 'email_verified_at';
  static String vCode = 'v_code';
  static String verified = 'verified';
  static String createdBy = 'created_by';

  // 🔹 Roles
  static String roles = 'roles';
  static String nameAr = 'name_ar';
  static String displayName = 'display_name';
  static String displayNameAr = 'display_name_ar';
  static String description = 'description';
  static String descriptionAr = 'description_ar';
  static String pivot = 'pivot';

  // 🔹 Pivot
  static String userId = 'user_id';
  static String roleId = 'role_id';

  // 🔹 Appointment Stats
  static String totalAppointments = 'total_appointments';
  static String scheduledAppointments = 'scheduled_appointments';
  static String completedAppointments = 'completed_appointments';
  static String cancelledAppointments = 'cancelled_appointments';
  static String unassignedAppointments = 'unassigned_appointments';
  static String assignedAppointments = 'assigned_appointments';
  static String todayAppointments = 'today_appointments';
  static String upcomingAppointments = 'upcoming_appointments';
  static String overdueAppointments = 'overdue_appointments';

  // 🔹 Doctor Schedule Data
  static String doctor = 'doctor';
  static String date = 'date';
  static String appointments = 'appointments';
  static String scheduledCount = 'scheduled_count';
  static String completedCount = 'completed_count';
  static String cancelledCount = 'cancelled_count';

  // 🔹 Doctor Info
  static String specialization = 'specialization';
  static String bio = 'bio';
  static String consultationFee = 'consultation_fee';
  static String isAvailable = 'is_available';

  // 🔹 Appointment Info
  static String patientId = 'patient_id';
  static String doctorId = 'doctor_id';
  static String appointmentDate = 'appointment_date';
  static String bookingSource = 'booking_source';
  static String notes = 'notes';
  static String fee = 'fee';
  static String isPaid = 'is_paid';
  static String paidAt = 'paid_at';
  static String paidAmount = 'paid_amount';
  static String patient = 'patient';

  // 🔹 Patient Info
  static String medicalRecordNumber = 'medical_record_number';
  static String fullName = 'full_name';
  static String firstName = 'first_name';
  static String fatherName = 'father_name';
  static String motherName = 'mother_name';
  static String familyName = 'family_name';
  static String nationality = 'nationality';
  static String gender = 'gender';
  static String nationalId = 'national_id';
  static String mobile = 'mobile';
  static String accountType = 'account_type';
  static String birthDate = 'birth_date';
  static String birthPlaceGovernorate = 'birth_place_governorate';
  static String birthPlaceArea = 'birth_place_area';
  static String currentGovernorate = 'current_governorate';
  static String currentArea = 'current_area';
  static String currentDistrict = 'current_district';
  static String currentDetailedAddress = 'current_detailed_address';
  static String profession = 'profession';
  static String maritalStatus = 'marital_status';
  static String spouseName = 'spouse_name';
  static String civilRegistryRecord = 'civil_registry_record';
  static String familyRegistryNumber = 'family_registry_number';
  static String bloodType = 'blood_type';
  static String allergies = 'allergies';
  static String chronicDiseases = 'chronic_diseases';
  static String medicalHistory = 'medical_history';
  static String currentMedications = 'current_medications';
  static String familyMedicalHistory = 'family_medical_history';
  static String insuranceProvider = 'insurance_provider';
  static String insuranceNumber = 'insurance_number';
  static String insuranceType = 'insurance_type';
  static String insuranceExpiryDate = 'insurance_expiry_date';
  static String educationLevel = 'education_level';
  static String monthlyIncome = 'monthly_income';
  static String notesKey = 'notes';
  static String isActive = 'is_active';
}
