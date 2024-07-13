import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduled_health/ui/screens/home/home_screen.dart';
import 'package:scheduled_health/ui/screens/splash/splash_screen.dart';
import 'package:scheduled_health/ui/screens/welcome/welcome_screen.dart';

enum AppRoutes {
  welcome(route: '/welcome'),
  splash(route: '/splash'),
  home(route: '/home');

  final String route;

  const AppRoutes({required this.route});
}

final appRoutes = <String, WidgetBuilder>{
  AppRoutes.welcome.route: (context) => const WelcomeScreen(),
  AppRoutes.splash.route: (context) => const SplashScreen(),
  AppRoutes.home.route: (context) => const HomeScreen(),
};



