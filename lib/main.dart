import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memorylife/ui/home_page.dart';
import 'package:memorylife/ui/man_cho/man_cho.dart';
import 'package:memorylife/ui/splash.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => MyApp(),
  "/intro1": (BuildContext context) => ManCho1(),
  "/intro2": (BuildContext context) => ManCho2(),
  "/intro3": (BuildContext context) => ManCho3(),
};

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_){
    runApp(MaterialApp(
      title: 'Memory Life',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes
    ));
  }
  );
}