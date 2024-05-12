import 'package:flutter/material.dart';
import 'package:kanban_board/core/constants/strings.dart';
import 'package:kanban_board/presentation/router/route_exception.dart';
import 'package:kanban_board/presentation/screens/home_screen.dart';
import 'package:kanban_board/presentation/screens/splash_screen.dart';


class AppRouter {
  static const String splash = '/', home = 'home';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}