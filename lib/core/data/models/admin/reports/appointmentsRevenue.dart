class AppointmentReportModel {
  final bool status;
  final AppointmentsRevenueData? data;
  final String? messages;
  final int? code;

  AppointmentReportModel({
    required this.status,
    this.data,
    this.messages,
    this.code,
  });

  factory AppointmentReportModel.fromJson(Map<String, dynamic> json) {
    return AppointmentReportModel(
      status: json['status'] == true,
      data: json['data'] != null
          ? AppointmentsRevenueData.fromJson(
              json['data'] as Map<String, dynamic>,
            )
          : null,
      messages: json['messages']?.toString(),
      code: (json['code'] is int)
          ? json['code'] as int
          : int.tryParse(json['code']?.toString() ?? ''),
    );
  }

  get appointmentsCount => data?.appointmentsCount;
}

class AppointmentsRevenueData {
  final MoneySummary? expectedRevenue;
  final ActualRevenue? actualRevenue;
  final Difference? difference;
  final AppointmentsCount? appointmentsCount;
  final List<ByDateItem> byDate;
  final List<ByDoctorItem> byDoctor;
  final List<ByStatusItem> byStatus;

  AppointmentsRevenueData({
    this.expectedRevenue,
    this.actualRevenue,
    this.difference,
    this.appointmentsCount,
    required this.byDate,
    required this.byDoctor,
    required this.byStatus,
  });

  factory AppointmentsRevenueData.fromJson(Map<String, dynamic> json) {
    return AppointmentsRevenueData(
      expectedRevenue: json['expected_revenue'] != null
          ? MoneySummary.fromJson(
              json['expected_revenue'] as Map<String, dynamic>,
            )
          : null,
      actualRevenue: json['actual_revenue'] != null
          ? ActualRevenue.fromJson(
              json['actual_revenue'] as Map<String, dynamic>,
            )
          : null,
      difference: json['difference'] != null
          ? Difference.fromJson(json['difference'] as Map<String, dynamic>)
          : null,
      appointmentsCount: json['appointments_count'] != null
          ? AppointmentsCount.fromJson(
              json['appointments_count'] as Map<String, dynamic>,
            )
          : null,
      byDate:
          (json['by_date'] as List<dynamic>?)
              ?.map((e) => ByDateItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      byDoctor:
          (json['by_doctor'] as List<dynamic>?)
              ?.map((e) => ByDoctorItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      byStatus:
          (json['by_status'] as List<dynamic>?)
              ?.map((e) => ByStatusItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class MoneySummary {
  final double total;
  final double paid;
  final double unpaid;

  MoneySummary({required this.total, required this.paid, required this.unpaid});

  factory MoneySummary.fromJson(Map<String, dynamic> json) => MoneySummary(
    total: _toDouble(json['total']),
    paid: _toDouble(json['paid']),
    unpaid: _toDouble(json['unpaid']),
  );
}

class ActualRevenue {
  final double total;
  final int count;
  final double average;

  ActualRevenue({
    required this.total,
    required this.count,
    required this.average,
  });

  factory ActualRevenue.fromJson(Map<String, dynamic> json) => ActualRevenue(
    total: _toDouble(json['total']),
    count: (json['count'] is int)
        ? json['count'] as int
        : int.tryParse(json['count']?.toString() ?? '0') ?? 0,
    average: _toDouble(json['average']),
  );
}

class Difference {
  final double amount;

  Difference({required this.amount});

  factory Difference.fromJson(Map<String, dynamic> json) =>
      Difference(amount: _toDouble(json['amount']));

  Map<String, dynamic> toJson() => {'amount': amount.toStringAsFixed(2)};
}

class AppointmentsCount {
  final int total;
  final int paid;
  final int unpaid;
  final int completed;
  final int scheduled;
  final int cancelled;

  AppointmentsCount({
    required this.total,
    required this.paid,
    required this.unpaid,
    required this.completed,
    required this.scheduled,
    required this.cancelled,
  });

  factory AppointmentsCount.fromJson(Map<String, dynamic> json) =>
      AppointmentsCount(
        total: _toInt(json['total']),
        paid: _toInt(json['paid']),
        unpaid: _toInt(json['unpaid']),
        completed: _toInt(json['completed']),
        scheduled: _toInt(json['scheduled']),
        cancelled: _toInt(json['cancelled']),
      );
}

class ByDateItem {
  final DateTime date;
  final double expectedRevenue;
  final double actualRevenue;
  final int count;

  ByDateItem({
    required this.date,
    required this.expectedRevenue,
    required this.actualRevenue,
    required this.count,
  });

  factory ByDateItem.fromJson(Map<String, dynamic> json) => ByDateItem(
    date: DateTime.tryParse(json['date']?.toString() ?? '') ?? DateTime.now(),
    expectedRevenue: _toDouble(json['expected_revenue']),
    actualRevenue: _toDouble(json['actual_revenue']),
    count: _toInt(json['count']),
  );
}

class ByDoctorItem {
  final String doctorId;
  final double expectedRevenue;
  final double actualRevenue;
  final int count;
  final Doctor? doctor;

  ByDoctorItem({
    required this.doctorId,
    required this.expectedRevenue,
    required this.actualRevenue,
    required this.count,
    this.doctor,
  });

  factory ByDoctorItem.fromJson(Map<String, dynamic> json) => ByDoctorItem(
    doctorId: json['doctor_id']?.toString() ?? '',
    expectedRevenue: _toDouble(json['expected_revenue']),
    actualRevenue: _toDouble(json['actual_revenue']),
    count: _toInt(json['count']),
    doctor: json['doctor'] != null
        ? Doctor.fromJson(json['doctor'] as Map<String, dynamic>)
        : null,
  );
}

class Doctor {
  final String id;
  final String name;

  Doctor({required this.id, required this.name});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? 'غير معروف',
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class ByStatusItem {
  final String status;
  final double expectedRevenue;
  final double actualRevenue;
  final int count;

  ByStatusItem({
    required this.status,
    required this.expectedRevenue,
    required this.actualRevenue,
    required this.count,
  });

  factory ByStatusItem.fromJson(Map<String, dynamic> json) => ByStatusItem(
    status: json['status']?.toString() ?? '',
    expectedRevenue: _toDouble(json['expected_revenue']),
    actualRevenue: _toDouble(json['actual_revenue']),
    count: _toInt(json['count']),
  );
}

// ✅ تحويل آمن للأرقام
double _toDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is double) return v;
  if (v is int) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}

int _toInt(dynamic v) {
  if (v == null) return 0;
  if (v is int) return v;
  return int.tryParse(v.toString()) ?? 0;
}
