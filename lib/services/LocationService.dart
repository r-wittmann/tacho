import 'dart:math';

class LocationService {

  /// calculateDistanceToPrevious calculates the distance between two locations in latitude and longitude
  /// parameters: previousLocation, currentLocation
  /// returns: double distance in kilometers
  static double calculateDistanceToPreviousInKm(Map<String, double> previousLocation, Map<String,double> currentLocation) {
    int earthRadius = 6366347;

    double previousLat = previousLocation['latitude'];
    double previousLon = previousLocation['longitude'];
    double currentLat = currentLocation['latitude'];
    double currentLon = currentLocation['longitude'];

    double dLat = degToRadians(currentLat - previousLat);
    double dLon = degToRadians(currentLon - previousLon);

    double a = sin(dLat / 2) * sin(dLat / 2)
        + cos(degToRadians(previousLat))
            * cos(degToRadians(currentLat)) * sin(dLon / 2)
            * sin(dLon / 2);
    double c = 2 * asin(sqrt(a));

    return (earthRadius * c).round() / 1000;
  }

  /// converts a degree value to radians
  /// parameters: double degree
  /// returns: double radians
  static double degToRadians(double degree) {
    return degree * (pi / 180.0);
  }

}