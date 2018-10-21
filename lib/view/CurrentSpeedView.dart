import 'package:flutter/material.dart';

class CurrentSpeedView extends StatelessWidget {
  final double _currentSpeed;

  CurrentSpeedView(this._currentSpeed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 96.0),
      child: Column(
        children: <Widget>[
          Text(
            (_currentSpeed * 3.6).toStringAsFixed(1),
            style: TextStyle(
              fontSize: 144,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            'km/h',
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
