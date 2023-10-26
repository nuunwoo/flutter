class Time {
  static DateTime dateTime = DateTime.now();

  static String currentTime() =>
      '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
}
