import 'package:flutter/material.dart';

class DistanceTraveledView extends StatelessWidget {
  final double _distanceTraveled;

  DistanceTraveledView(this._distanceTraveled);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${_distanceTraveled.toStringAsFixed(2)} km',
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
