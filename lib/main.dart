import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tacho/view/ContainerView.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(SplashScreen());

  SharedPreferences prefs;

  Future<void> getPrefs() async{
    prefs = await SharedPreferences.getInstance();
    return null;
  }

  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    getPrefs(),
  ]).then((_) {
    runApp(new MyApp(prefs));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp(this.prefs);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange[900],
        accentColor: Colors.orange[900],
      ),
      home: ContainerView(prefs),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(),
    );
  }
}
