import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tacho/view/AverageSpeedView.dart';
import 'package:tacho/view/DistanceTraveledView.dart';
import 'package:tacho/view/StopWatchView.dart';

class TabView extends StatefulWidget {
  final double distanceTraveled;
  final Stopwatch stopwatch;

  const TabView(this.distanceTraveled, this.stopwatch);

  @override
  State createState() => TabViewState();
}

class TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => _tabController.animateTo((_tabController.index + 1) % 3));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: TabPageSelector(controller: _tabController),
            ),
          ),
        ),
        SizedBox(
          height: 96,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              DistanceTraveledView(widget.distanceTraveled),
              StopWatchView(widget.stopwatch),
              AverageSpeedView(widget.stopwatch, widget.distanceTraveled),
            ],
          ),
        ),
      ],
    );
  }
}
