class StopWatchService {

  /// transforms the stopwatch to a format of h:mm:ss
  /// parameters: Stopwatch stopwatch
  /// returns: String formattedString
  static String getFormattedTime(Stopwatch stopwatch) {
    String formattedString = stopwatch.elapsed.toString().split('.')[0];
    return formattedString;
  }

  /// calculates the elapsed Hours
  /// parameters Stopwatch stopwatch
  /// returns double elapsedHours
  static double getElapsedHours(Stopwatch stopwatch) {
    double elapsedHours = stopwatch.elapsedMilliseconds / 1000 / 3600;
    return elapsedHours;
  }

}