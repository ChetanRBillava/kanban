import 'package:flutter/material.dart';
import 'package:kanban_board/core/constants/strings.dart';
import 'package:kanban_board/presentation/router/route_exception.dart';
import 'package:kanban_board/presentation/screens/dummy/persistent/screens/home_screen.dart';
import 'package:kanban_board/presentation/screens/kanban/screens/kanban_form.dart';
import 'package:kanban_board/presentation/screens/kanban/screens/kanban_home.dart';
import 'package:kanban_board/presentation/screens/splash_screen.dart';


class AppRouter {
  static const String splash = '/', dummy = 'dummy', home = 'home', kanbanForm = 'kanbanForm';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case dummy:
        return MaterialPageRoute(
          builder: (_) => const DummyScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const KanbanHome(),
        );
      case kanbanForm:
        return MaterialPageRoute(
          builder: (_) => const KanbanForm(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}