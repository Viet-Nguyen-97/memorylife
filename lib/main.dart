import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_config.dart';
import 'router.dart' as Router;
import 'ui/splash.dart';

//var routes = <String, WidgetBuilder>{
//  "/home": (BuildContext context) => MyApp(),
//  "/intro1": (BuildContext context) => BeginScreen(),
//  "/intro2": (BuildContext context) => TwoScreen(),
//  "/intro3": (BuildContext context) => ThreeScreen(),
//};

void main() {
//  MyApp.initSystemDefault();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    AppConfig(
      appName: "ANGEL",
      debugTag: false,
      flavorName: "prod",
      initialRoute: Router.BaseRouter.SPLASH,
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    getKeyHash();
    final config = AppConfig.of(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,

//          fontFamily: 'Poppins',
      ),
      onGenerateRoute: Router.BaseRouter.generateRoute,
      routes: Router.BaseRouter.routes(context),
      home: SplashScreen(),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
