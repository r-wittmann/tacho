import 'package:flutter/material.dart';

class TotalDistanceTraveledView extends StatelessWidget {
  final double _totalDistanceTraveled;

  TotalDistanceTraveledView(this._totalDistanceTraveled);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${_totalDistanceTraveled.toStringAsFixed(2)} km',
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
