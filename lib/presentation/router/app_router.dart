import 'package:flutter/material.dart';
import 'package:kanban/core/constants/strings.dart';
import 'package:kanban/presentation/router/route_exception.dart';
import 'package:kanban/presentation/screens/dummy/hydrated_bloc/screens/hydrated_bloc_screen.dart';
import 'package:kanban/presentation/screens/kanban/reference/kanban_reference_screen.dart';
import 'package:kanban/presentation/screens/kanban/reference_2/drag_and_drop_screen.dart';
import 'package:kanban/presentation/screens/kanban/reference_3/draggable_widget.dart';
import 'package:kanban/presentation/screens/kanban/screens/kanban_form.dart';
import 'package:kanban/presentation/screens/kanban/screens/kanban_home.dart';
import 'package:kanban/presentation/screens/splash_screen.dart';


class AppRouter {
  static const String splash = '/', hydratedBlocScreen = 'hydratedBlocScreen', home = 'home',
      kanbanForm = 'kanbanForm', kanbanReference = 'kanbanReference',
      dragAndDropReference = 'dragAndDropReference', draggableWidget = 'draggableWidget';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case hydratedBlocScreen:
        return MaterialPageRoute(
          builder: (_) => const HydratedBlocScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const KanbanHome(),
        );
      case kanbanForm:
        return MaterialPageRoute(
          builder: (_) => const KanbanForm(),
        );
      case kanbanReference:
        return MaterialPageRoute(
          builder: (_) => const KanbanReferenceScreen(),
        );
      case dragAndDropReference:
        return MaterialPageRoute(
          builder: (_) => const DragAndDropScreen(),
        );
      case draggableWidget:
        return MaterialPageRoute(
          builder: (_) => const DraggableWidget(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}