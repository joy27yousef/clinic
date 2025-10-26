class ComprehensiveReportModel {
  final bool status;
  final FinancialData? data;
  final String? messages;
  final int? code;

  ComprehensiveReportModel({
    required this.status,
    this.data,
    this.messages,
    this.code,
  });

  factory ComprehensiveReportModel.fromJson(Map<String, dynamic> json) {
    return ComprehensiveReportModel(
      status: json['status'] == true,
      data: json['data'] != null
          ? FinancialData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      messages: json['messages']?.toString(),
      code: (json['code'] is int)
          ? json['code'] as int
          : int.tryParse(json['code']?.toString() ?? ''),
    );
  }
}

class FinancialData {
  final ReportPeriod? period;
  final Revenue? revenue;
  final Expenses? expenses;
  final Profit? profit;
  final MonthlyAverage? monthlyAverage;
  final ChartData? chartData;

  FinancialData({
    this.period,
    this.revenue,
    this.expenses,
    this.profit,
    this.monthlyAverage,
    this.chartData,
  });

  factory FinancialData.fromJson(Map<String, dynamic> json) {
    return FinancialData(
      period: json['period'] != null
          ? ReportPeriod.fromJson(json['period'])
          : null,
      revenue: json['revenue'] != null
          ? Revenue.fromJson(json['revenue'])
          : null,
      expenses: json['expenses'] != null
          ? Expenses.fromJson(json['expenses'])
          : null,
      profit: json['profit'] != null ? Profit.fromJson(json['profit']) : null,
      monthlyAverage: json['monthly_average'] != null
          ? MonthlyAverage.fromJson(json['monthly_average'])
          : null,
      chartData: json['chart_data'] != null
          ? ChartData.fromJson(json['chart_data'])
          : null,
    );
  }

  get monthlyData => null;
}

class ReportPeriod {
  final String startDate;
  final String endDate;

  ReportPeriod({required this.startDate, required this.endDate});

  factory ReportPeriod.fromJson(Map<String, dynamic> json) {
    return ReportPeriod(
      startDate: json['start_date']?.toString() ?? '',
      endDate: json['end_date']?.toString() ?? '',
    );
  }
}

class Revenue {
  final double appointments;
  final double laboratoryTests;
  final double radiologyTests;
  final double total;

  Revenue({
    required this.appointments,
    required this.laboratoryTests,
    required this.radiologyTests,
    required this.total,
  });

  factory Revenue.fromJson(Map<String, dynamic> json) {
    return Revenue(
      appointments: _toDouble(json['appointments']),
      laboratoryTests: _toDouble(json['laboratory_tests']),
      radiologyTests: _toDouble(json['radiology_tests']),
      total: _toDouble(json['total']),
    );
  }
}

class Expenses {
  final double total;
  final List<ExpenseCategory> byCategory;

  Expenses({required this.total, required this.byCategory});

  factory Expenses.fromJson(Map<String, dynamic> json) {
    return Expenses(
      total: _toDouble(json['total']),
      byCategory:
          (json['by_category'] as List?)
              ?.map((e) => ExpenseCategory.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ExpenseCategory {
  final String category;
  final double total;

  ExpenseCategory({required this.category, required this.total});

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) {
    return ExpenseCategory(
      category: json['category']?.toString() ?? 'غير محدد',
      total: _toDouble(json['total']),
    );
  }

  get doctor => null;
}

class Profit {
  final double netProfit;
  final double profitMargin;

  Profit({required this.netProfit, required this.profitMargin});

  factory Profit.fromJson(Map<String, dynamic> json) {
    return Profit(
      netProfit: _toDouble(json['net_profit']),
      profitMargin: _toDouble(json['profit_margin']),
    );
  }
}

class MonthlyAverage {
  final double revenue;
  final double expenses;
  final double profit;

  MonthlyAverage({
    required this.revenue,
    required this.expenses,
    required this.profit,
  });

  factory MonthlyAverage.fromJson(Map<String, dynamic> json) {
    return MonthlyAverage(
      revenue: _toDouble(json['revenue']),
      expenses: _toDouble(json['expenses']),
      profit: _toDouble(json['profit']),
    );
  }
}

class ChartData {
  final List<RevenueByDate> revenueByDate;
  final List<ExpensesByDate> expensesByDate;
  final List<ComparisonData> comparison;

  ChartData({
    required this.revenueByDate,
    required this.expensesByDate,
    required this.comparison,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      revenueByDate:
          (json['revenue_by_date'] as List?)
              ?.map((e) => RevenueByDate.fromJson(e))
              .toList() ??
          [],
      expensesByDate:
          (json['expenses_by_date'] as List?)
              ?.map((e) => ExpensesByDate.fromJson(e))
              .toList() ??
          [],
      comparison:
          (json['comparison'] as List?)
              ?.map((e) => ComparisonData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class RevenueByDate {
  final String date;
  final double revenue;

  RevenueByDate({required this.date, required this.revenue});

  factory RevenueByDate.fromJson(Map<String, dynamic> json) {
    return RevenueByDate(
      date: json['date']?.toString() ?? '',
      revenue: _toDouble(json['revenue']),
    );
  }
}

class ExpensesByDate {
  final String date;
  final double expenses;

  ExpensesByDate({required this.date, required this.expenses});

  factory ExpensesByDate.fromJson(Map<String, dynamic> json) {
    return ExpensesByDate(
      date: json['date']?.toString() ?? '',
      expenses: _toDouble(json['expenses']),
    );
  }
}

class ComparisonData {
  final String period;
  final double revenue;
  final double expenses;
  final double profit;

  ComparisonData({
    required this.period,
    required this.revenue,
    required this.expenses,
    required this.profit,
  });

  factory ComparisonData.fromJson(Map<String, dynamic> json) {
    return ComparisonData(
      period: json['period']?.toString() ?? '',
      revenue: _toDouble(json['revenue']),
      expenses: _toDouble(json['expenses']),
      profit: _toDouble(json['profit']),
    );
  }
}

// ✅ دوال مساعدة آمنة لتحويل القيم
double _toDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is double) return v;
  if (v is int) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}
