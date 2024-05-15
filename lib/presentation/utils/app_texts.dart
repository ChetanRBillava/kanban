import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/logic/cubit/app_theme_cubit.dart';

class AppTexts {
  static Widget labelText({required TextProperties textProperties}) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Text(
          textProperties.text,
          style: TextStyle(
              fontSize: 24,
              color:  textProperties.textColor ?? appThemeState.themeClass.textColorPrimary
          ),
        );
      },
    );
  }

  static Widget headingText({required TextProperties textProperties}) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Text(
          textProperties.text,
          style: TextStyle(
              fontSize: 16,
              color:  textProperties.textColor ?? appThemeState.themeClass.textColorPrimary
          ),
        );
      },
    );
  }

  static Widget normalText({required TextProperties textProperties}) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Text(
          textProperties.text,
          style: TextStyle(
              fontSize: 12,
              color:  textProperties.textColor ?? appThemeState.themeClass.textColorPrimary
          ),
        );
      },
    );
  }

  static Widget captionText({required TextProperties textProperties}) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Text(
          textProperties.text,
          style: TextStyle(
              fontSize: 10,
              color:  textProperties.textColor ?? appThemeState.themeClass.textCaptionColor
          ),
        );
      },
    );
  }
}

class TextProperties {
  String text;
  Color? textColor;

  TextProperties({
    required this.text,
    this.textColor,
  });
}