import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tacho/view/ContainerView.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tacho',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange[900],
        accentColor: Colors.orange[900],
      ),
      home: ContainerView(),
    );
  }
}
