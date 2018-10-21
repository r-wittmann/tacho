import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:screen/screen.dart';
import 'package:tacho/services/LocationService.dart';
import 'package:tacho/view/CurrentSpeedView.dart';
import 'package:tacho/view/TabView.dart';

class ContainerView extends StatefulWidget {
  @override
  State createState() => ContainerViewState();
}

class ContainerViewState extends State<ContainerView> {
  bool _tourRunning = false;
  Location _location = Location();
  StreamSubscription<Map<String, double>> _locationSubscription;
  String error;

  Stopwatch _stopwatch = Stopwatch();

  Map<String, double> _currentLocation;
  double _currentSpeed = 0.0;
  double _distanceTraveled = 0.0;

  @override
  void initState() {
    super.initState();
    Screen.keepOn(true);
    initPlatformState();
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  initPlatformState() async {
    try {
      await _location.hasPermission();
      await _location.getLocation();

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }
    }
  }

  void startTour() {
    _stopwatch.reset();
    _stopwatch.start();
    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) => handleLocationChange(result));

    setState(() {
      _tourRunning = true;
      _currentSpeed = 0.0;
      _distanceTraveled = 0.0;
    });
  }

  void endTour() {
    _stopwatch.stop();
    _locationSubscription.cancel();

    setState(() {
      _tourRunning = false;
      _currentSpeed = 0.0;
    });
  }

  void handleLocationChange(Map<String, double> location) {
    if (_tourRunning && location['speed'] > 2.0) {
      _stopwatch.start();
      double distance = 0.0;

      if (_currentLocation != null) {
        distance = LocationService.calculateDistanceToPreviousInKm(_currentLocation, location);
      }

      setState(() {
        _currentLocation = location;
        _currentSpeed = (_currentSpeed + 2 * location['speed']) / 3;
        _distanceTraveled = _distanceTraveled + distance;
      });
    } else {
      _stopwatch.stop();
      setState(() {
        _currentSpeed = 0.0;
        _currentLocation = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CurrentSpeedView(_currentSpeed),
          TabView(_distanceTraveled, _stopwatch),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: !_tourRunning ? () => this.startTour() : () => this.endTour(),
        icon: !_tourRunning ? Icon(Icons.play_arrow) : Icon(Icons.stop),
        label: !_tourRunning ? Text('Fahrt starten') : Text('Fahrt beenden'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
