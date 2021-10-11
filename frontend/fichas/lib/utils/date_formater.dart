class DateFormat {
  /// receives a date in the formar
  /// YYYY-MM-DDPHH:MM:SS.FUSO
  /// and formats into
  /// DD/MM/YYYY

  static String dateFromJson(String dateJson) {
    var year = dateJson.substring(0, 4);
    var month = dateJson.substring(5, 7);
    var day = dateJson.substring(8, 10);

    return "$day/$month/$year";
  }
}
