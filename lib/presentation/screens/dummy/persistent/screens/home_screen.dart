import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/core/constants/strings.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/screens/dummy/persistent/cubit/dummy_cubit.dart';
import 'package:kanban/presentation/utils/app_texts.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
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
        return BlocBuilder<DummyCubit, DummyState>(
          builder: (context, dummyState) {
            return Scaffold(
              backgroundColor: appThemeState.themeClass.backgroundColor,
              appBar: AppBar(
                //leading: Icon(Icons.arrow_back, color: appThemeState.themeClass.textColor_1,),
                automaticallyImplyLeading: false,
                backgroundColor: appThemeState.themeClass.appbarBackgroundColor,
                title: AppTexts.headingText(
                    textProperties: TextProperties(text: Strings.kanbanHome)),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    AppTexts.normalText(
                        textProperties: TextProperties(text: 'You have pushed the button this many times:'))      ,
                    AppTexts.headingText(
                        textProperties: TextProperties(text: dummyState.count.toString()))
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){

                  BlocProvider.of<DummyCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            );
          },
        );
      },
    );
  }
}
