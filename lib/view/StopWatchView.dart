import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tacho/services/StopWatchService.dart';

class StopWatchView extends StatefulWidget {
  final Stopwatch stopwatch;

  const StopWatchView(this.stopwatch);

  @override
  State createState() => StopWatchViewState();
}

class StopWatchViewState extends State<StopWatchView> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (Timer t) => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        StopWatchService.getFormattedTime(widget.stopwatch),
        style: TextStyle(fontSize: 36),
      ),
      SizedBox(height: 12)
    ]);
  }
}
