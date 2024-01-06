import 'package:flutter/material.dart';

import '../../core/utiles/app_componantes.dart';
import '../../fetures/log_in/presentation/pages/log_in.dart';
import '../../fetures/sig_up/presentation/pages/sign_up.dart';
import '../../fetures/splash/splash_screen.dart';
class Routes{
  static const String Splash="/";
  static const String logIn= "logIn";
  static const String signUp= "signUp";
}

class AppRoutes{
 static Route onGenerat(RouteSettings routeSettings){
  switch (routeSettings.name){
    case Routes.Splash :
      return MaterialPageRoute(builder: (context) => const SplashScreen(),);
    case Routes.logIn :
      return MaterialPageRoute(builder: (context) => const LogInScreen(),);
    case Routes.signUp :
      return MaterialPageRoute(builder: (context) => const SignUpScreen(),);
     default:
       return MaterialPageRoute(builder: (context) =>  UnDefineWidget(),);
  }

   }
}

