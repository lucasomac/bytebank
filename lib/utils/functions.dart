class Functions {
  static String unMask(String value) {
    return value.replaceAll(RegExp("[^0-9,]+"), '').replaceAll(',', '.');
  }
}
