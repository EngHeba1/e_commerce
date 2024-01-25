import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utiles/app_componantes.dart';
import '../../fetures/home/presentation/pages/home_screen.dart';
import '../../fetures/log_in/data/data_sources/remot_login_dto.dart';
import '../../fetures/log_in/presentation/cubit/login_cubit.dart';
import '../../fetures/log_in/presentation/pages/log_in.dart';
import '../../fetures/sig_up/presentation/pages/sign_up.dart';
import '../../fetures/splash/splash_screen.dart';
class Routes{
  static const String Splash="splash";
  static const String logIn= "/";
  static const String signUp= "signUp";
  static const String home= "home";
}

class AppRoutes{
 static Route onGenerat(RouteSettings routeSettings){
  switch (routeSettings.name){
    case Routes.Splash :
      return MaterialPageRoute(builder: (context) => const SplashScreen(),);
    case Routes.logIn :
      return MaterialPageRoute(builder: (context) =>
          BlocProvider(create: (BuildContext context) =>LogInCubit(LogInRemotDto()),
         child:  LogInScreen()),);
    case Routes.signUp :
      return MaterialPageRoute(builder: (context) => const SignUpScreen(),);
    case Routes.home:
  return MaterialPageRoute(builder: (context) => const HomeScreen(),);
  default:
  return MaterialPageRoute(builder: (context) =>  UnDefineWidget(),);


  }

   }
}

