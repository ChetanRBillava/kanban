import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/core/themes/app_theme.dart';
import 'package:kanban/presentation/utils/custom_print.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState.initialize());

  Future<String> getThemeType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeValue = prefs.getString('themeType') ?? 'auto';
    return themeValue;
  }

  Future<void> setThemeType(String themeValue) async {
    customPrint.myCustomPrint(themeValue);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeType', themeValue);

    String themeSetting = '';
    if(themeValue =='light'){
      themeSetting = 'Light Mode Only Activated';
    }
    else if(themeValue =='dark'){
      themeSetting = 'Dark Mode Only Activated';
    }
    else{
      themeSetting = 'Auto Switching Activated';
    }


    emit(state.copyWith(
        themeSetting: themeSetting));
  }

  void setLightTheme() {
    String themeSetting = 'Light mode only activated';

    LightTheme lightTheme = LightTheme();
    customPrint.myCustomPrint('Light mode');
    customPrint.myCustomPrint(themeSetting);

    emit(state.copyWith(brightness: Brightness.light,
        themeClass: lightTheme,));
  }

  void setDarkTheme() {
    String themeSetting = 'Dark mode only activated';

    DarkTheme darkTheme = DarkTheme();
    customPrint.myCustomPrint(themeSetting);
    customPrint.myCustomPrint('Dark mode');

    emit(state.copyWith(brightness: Brightness.dark,
        themeClass: darkTheme,));
  }

  Future<void> checkTheme() async {
    final Brightness currentBrightness = SchedulerBinding.instance.window
        .platformBrightness;
    String userTheme = await getThemeType();
    customPrint.myCustomPrint('User theme $userTheme');
    if (userTheme == 'light') {
      setThemeType('light');
      setLightTheme();
    }
    else if (userTheme == 'dark') {
      setThemeType('dark');
      setDarkTheme();
    }
    else {
      setThemeType('auto');
      customPrint.myCustomPrint('Initial brightness $currentBrightness');
      if (currentBrightness == Brightness.light) {
        setLightTheme();
      }
      else {
        setDarkTheme();
      }
    }
  }

  Color getInProgress(){
    return state.themeClass.successColor;
  }
}
