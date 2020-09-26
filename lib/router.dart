import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/ui/create_new_diary/create.dart';
import 'package:memorylife/ui/man_cho/sc_begin.dart';
import 'package:memorylife/ui/man_cho/sc_three_screen.dart';
import 'package:memorylife/ui/man_cho/sc_two_screen.dart';

import 'ui/home_page.dart';
import 'ui/login.dart';
import 'ui/pincode/new_pin.dart';
import 'ui/splash.dart';

class BaseRouter {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String SPLASH_ONE = '/splash_one';
  static const String SPLASH_TWO = '/splash_two';
  static const String SPLASH_THREE = '/splash_three';
  static const String OTP = '/otp';
  static const String NAVIGATION = '/navigation';
  static const String CREATE_DIARY = '/create_diary';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case SPLASH_ONE:
        return MaterialPageRoute(builder: (_) => BeginScreen());
      case SPLASH_TWO:
        return MaterialPageRoute(builder: (_) => TwoScreen());
      case SPLASH_THREE:
        return MaterialPageRoute(builder: (_) => ThreeScreen());
      case NAVIGATION:
        return MaterialPageRoute(builder: (_) => MyHomePage(title: "Memory Life",));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      SPLASH: (context) => SplashScreen(),
      SPLASH_ONE: (context) => BeginScreen(),
      SPLASH_TWO: (context) => TwoScreen(),
      SPLASH_THREE: (context) => ThreeScreen(),
      LOGIN: (context) => Login(),
      OTP: (context) => PinPutTest(),
      NAVIGATION: (context) => MyHomePage(title: "Memory Life",),
      CREATE_DIARY: (context) => CreateNewDiary(),
    };
  }
}
