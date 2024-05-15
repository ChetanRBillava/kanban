import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kanban_board/core/constants/strings.dart';
import 'package:kanban_board/presentation/router/app_router.dart';
import 'package:kanban_board/presentation/screens/dummy/persistent/cubit/dummy_cubit.dart';
import 'package:kanban_board/presentation/screens/dummy/persistent/screens/home_screen.dart';

import 'package:kanban_board/logic/cubit/app_theme_cubit.dart';
import 'package:kanban_board/presentation/screens/kanban/cubit/kanban_cubit.dart';
import 'package:kanban_board/presentation/screens/kanban/cubit/kanban_form_cubit.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // path-provider
  final directory = await getApplicationDocumentsDirectory();
  // init storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
        ),
        BlocProvider(
          create: (context) => DummyCubit(),
        ),
        BlocProvider(
          create: (context) => KanbanFormCubit(),
        ),
        BlocProvider(
          create: (context) => KanbanCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appTitle,
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}