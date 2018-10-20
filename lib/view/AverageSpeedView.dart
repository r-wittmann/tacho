import 'package:flutter/material.dart';
import 'package:tacho/services/StopWatchService.dart';

class AverageSpeedView extends StatelessWidget {
  final Stopwatch stopwatch;
  final double _distanceTraveled;

  const AverageSpeedView(this.stopwatch, this._distanceTraveled);

  double getAverageSpeed() {
    double elapsedHours = StopWatchService.getElapsedHours(stopwatch);
    return elapsedHours == 0 ? 0.0 : _distanceTraveled / elapsedHours;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${getAverageSpeed().toStringAsFixed(1)} km/h',
      style: TextStyle(fontSize: 36),
    );
  }
}
