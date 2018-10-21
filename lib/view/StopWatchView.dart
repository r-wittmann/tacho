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
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) => setState(() => {}));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StopWatchService.getFormattedTime(widget.stopwatch),
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
