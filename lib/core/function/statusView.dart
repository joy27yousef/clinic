String viewStatus(String status) {
  switch (status.toLowerCase()) {
    case 'scheduled':
      return "مجدول";
    case 'completed':
      return "مكتمل";
    case 'cancelled':
      return "ملغى";
    default:
      return "غير معروف";
  }
}
