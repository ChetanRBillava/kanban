import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/core/constants/images.dart';
import 'package:kanban_board/core/constants/strings.dart';
import 'package:kanban_board/logic/cubit/app_theme_cubit.dart';
import 'package:kanban_board/presentation/router/app_router.dart';
import 'package:kanban_board/presentation/utils/app_texts.dart';
import 'package:kanban_board/presentation/utils/custom_print.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 1), () {
      BlocProvider.of<AppThemeCubit>(context).checkTheme();
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamed(AppRouter.home);
      });
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Future<void> didChangePlatformBrightness() async {
    // TODO: implement didChangePlatformBrightness
    customPrint.myCustomPrint('Updating brightness');
    final Brightness currentBrightness = SchedulerBinding.instance.window
        .platformBrightness;

    String userTheme = await BlocProvider.of<AppThemeCubit>(context)
        .getThemeType();
    customPrint.myCustomPrint('User theme $userTheme');
    if (userTheme == 'auto') {
      customPrint.myCustomPrint('Brightness changed $currentBrightness');
      if (currentBrightness == Brightness.light) {
        BlocProvider.of<AppThemeCubit>(context).setLightTheme();
      }
      else {
        BlocProvider.of<AppThemeCubit>(context).setDarkTheme();
      }
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Scaffold(
          backgroundColor: appThemeState.themeClass.backgroundColor,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, width: MediaQuery.sizeOf(context).width/2, height: MediaQuery.sizeOf(context).width/2,),
                  AppTexts.labelText(textProperties: TextProperties(text: Strings.appTitle))      ,
                  AppTexts.normalText(textProperties: TextProperties(text: Strings.appVersion))      ,
                  const CircularProgressIndicator(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
