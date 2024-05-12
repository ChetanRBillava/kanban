import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/core/constants/strings.dart';
import 'package:kanban_board/logic/cubit/app_theme_cubit.dart';
import 'package:kanban_board/presentation/utils/app_texts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
  builder: (context, appThemeState) {
    return Scaffold(
      backgroundColor: appThemeState.themeClass.backgroundColor,
      appBar: AppBar(
        //leading: Icon(Icons.arrow_back, color: appThemeState.themeClass.textColor_1,),
        automaticallyImplyLeading: false,
        backgroundColor: appThemeState.themeClass.appbarBackgroundColor,
        title: AppTexts.headingText(textProperties: TextProperties(text: Strings.homePage)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  },
);
  }
}
