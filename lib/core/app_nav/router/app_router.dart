 import 'package:drivo/core/app_nav/router/routes.dart';
import 'package:drivo/features/home/presentation/screens/home_screen.dart';
import 'package:drivo/features/layout/presentation/screens/layout_screen.dart';
import 'package:drivo/features/login/presentation/screens/login_screen.dart';
import 'package:drivo/features/register/presentation/screens/register_screen.dart';
import 'package:drivo/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../../features/splash/presentation/screens/splash_screen_2.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.splashScreen2:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen2(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
        );

      default:
        return null;
    }
  }
}