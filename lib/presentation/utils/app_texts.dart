import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';

class AppTexts {
  static Widget labelText({required TextProperties textProperties}) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Text(
          textProperties.text,
          maxLines: textProperties.maxLines??1,
          style: TextStyle(
              fontSize: 24,
              color:  textProperties.textColor ?? appThemeState.themeClass.textColorPrimary,
            decoration: textProperties.textDecoration??TextDecoration.none,
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
          maxLines: textProperties.maxLines??1,
          style: TextStyle(
              fontSize: 16,
              color:  textProperties.textColor ?? appThemeState.themeClass.textColorPrimary,
            decoration: textProperties.textDecoration??TextDecoration.none,
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
          maxLines: textProperties.maxLines??1,
          style: TextStyle(
              fontSize: 12,
              color:  textProperties.textColor ?? appThemeState.themeClass.textColorPrimary,
            decoration: textProperties.textDecoration??TextDecoration.none,
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
          maxLines: textProperties.maxLines??1,
          style: TextStyle(
              fontSize: 10,
              color:  textProperties.textColor ?? appThemeState.themeClass.textCaptionColor,
            decoration: textProperties.textDecoration??TextDecoration.none,
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
  int? maxLines;
  TextDecoration? textDecoration;

  TextProperties({
    required this.text,
    this.textColor,
    this.maxLines,
    this.textDecoration,
  });
}