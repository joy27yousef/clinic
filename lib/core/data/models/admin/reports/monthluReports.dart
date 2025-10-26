class MonthlyProfitReportModel {
  final bool status;
  final MonthlyProfitData? data;
  final String? messages;
  final int? code;

  MonthlyProfitReportModel({
    required this.status,
    this.data,
    this.messages,
    this.code,
  });

  factory MonthlyProfitReportModel.fromJson(Map<String, dynamic> json) {
    return MonthlyProfitReportModel(
      status: json['status'] == true,
      data: json['data'] != null
          ? MonthlyProfitData.fromJson(json['data'])
          : null,
      messages: json['messages']?.toString(),
      code: _toInt(json['code']),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data?.toJson(),
    'messages': messages,
    'code': code,
  };
}

class MonthlyProfitData {
  final int year;
  final List<MonthlyData> monthlyData;
  final Totals? totals;
  final Averages? averages;

  MonthlyProfitData({
    required this.year,
    required this.monthlyData,
    this.totals,
    this.averages,
  });

  factory MonthlyProfitData.fromJson(Map<String, dynamic> json) {
    return MonthlyProfitData(
      year: _toInt(json['year']),
      monthlyData:
          (json['monthly_data'] as List?)
              ?.map((e) => MonthlyData.fromJson(e))
              .toList() ??
          [],
      totals: json['totals'] != null ? Totals.fromJson(json['totals']) : null,
      averages: json['averages'] != null
          ? Averages.fromJson(json['averages'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'year': year,
    'monthly_data': monthlyData.map((e) => e.toJson()).toList(),
    'totals': totals?.toJson(),
    'averages': averages?.toJson(),
  };
}

class MonthlyData {
  final int month;
  final String monthName;
  final String monthNameAr;
  final double revenue;
  final double expenses;
  final double profit;

  MonthlyData({
    required this.month,
    required this.monthName,
    required this.monthNameAr,
    required this.revenue,
    required this.expenses,
    required this.profit,
  });

  factory MonthlyData.fromJson(Map<String, dynamic> json) {
    return MonthlyData(
      month: _toInt(json['month']),
      monthName: json['month_name']?.toString() ?? '',
      monthNameAr: json['month_name_ar']?.toString() ?? '',
      revenue: _toDouble(json['revenue']),
      expenses: _toDouble(json['expenses']),
      profit: _toDouble(json['profit']),
    );
  }

  Map<String, dynamic> toJson() => {
    'month': month,
    'month_name': monthName,
    'month_name_ar': monthNameAr,
    'revenue': revenue,
    'expenses': expenses,
    'profit': profit,
  };
}

class Totals {
  final double revenue;
  final double expenses;
  final double profit;

  Totals({required this.revenue, required this.expenses, required this.profit});

  factory Totals.fromJson(Map<String, dynamic> json) {
    return Totals(
      revenue: _toDouble(json['revenue']),
      expenses: _toDouble(json['expenses']),
      profit: _toDouble(json['profit']),
    );
  }

  Map<String, dynamic> toJson() => {
    'revenue': revenue,
    'expenses': expenses,
    'profit': profit,
  };
}

class Averages {
  final double revenue;
  final double expenses;
  final double profit;

  Averages({
    required this.revenue,
    required this.expenses,
    required this.profit,
  });

  factory Averages.fromJson(Map<String, dynamic> json) {
    return Averages(
      revenue: _toDouble(json['revenue']),
      expenses: _toDouble(json['expenses']),
      profit: _toDouble(json['profit']),
    );
  }

  Map<String, dynamic> toJson() => {
    'revenue': revenue,
    'expenses': expenses,
    'profit': profit,
  };
}

/// ✅ دوال تحويل آمنة
double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  return int.tryParse(value.toString()) ?? 0;
}
