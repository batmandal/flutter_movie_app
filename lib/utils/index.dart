class Utils {
  static String InterMinToString(int? min) {
    if (min == null) return "-";
    return "${(min / 60).floor()} цаг ${min % 60} мин";
  }
}
