import 'package:flutter/material.dart';

class AppTheme {
  ///main
  late Color backgroundColor;
  late Color formFieldBackgroundColor;
  late Color enabledFormFieldBorderColor;
  late Color focusedFormFieldBorderColor;
  late Color appbarBackgroundColor;
  late Color primaryColor;
  late Color secondaryColor;

  ///selections
  late Color successColor;
  late Color dangerColor;
  late Color infoColor;
  late Color warningColor;

  ///texts
  late Color textColorPrimary;
  late Color textColorSecondary;
  late Color textCaptionColor;

  ///icon
  late Color iconPrimary;

  ///card
  late Color cardBackground;

  ///button
  late Color buttonBackgroundColorPrimary;
  late Color buttonBackgroundColorSecondary;

  ///constant colors
  late Color white;
  late Color black;

}

class LightTheme extends AppTheme{
  LightTheme();

  ///main
  @override
  // TODO: implement primary
  Color get backgroundColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get formFieldBackgroundColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get enabledFormFieldBorderColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get focusedFormFieldBorderColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get appbarBackgroundColor => const Color(0xff719bf1);

  @override
  // TODO: implement primary
  Color get primaryColor => const Color(0xff719bf1);

  @override
  // TODO: implement primary
  Color get secondaryColor => const Color(0xffffffff);

  ///selections
  @override
  // TODO: implement primary
  Color get successColor => const Color(0xff2ee719);

  @override
  // TODO: implement primary
  Color get dangerColor => const Color(0xfff60f0f);

  @override
  // TODO: implement primary
  Color get infoColor => const Color(0xff719bf1);

  @override
  // TODO: implement primary
  Color get warningColor => const Color(0xffffd719);

  ///texts
  @override
  // TODO: implement primary
  Color get textColorPrimary => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get textColorSecondary => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get textCaptionColor => const Color(0xff616060);

  ///icons
  @override
  // TODO: implement primary
  Color get iconPrimary => const Color(0xff000000);

  ///card
  @override
  // TODO: implement primary
  Color get cardBackground => const Color(0xfff1ebeb);

  ///button
  @override
  // TODO: implement primary
  Color get buttonBackgroundColorPrimary => const Color(0xff5789ee);

  @override
  // TODO: implement primary
  Color get buttonBackgroundColorSecondary => const Color(0xffffffff);

  ///constant colors
  @override
  // TODO: implement primary
  Color get white => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get black => const Color(0xff000000);
}

class DarkTheme extends AppTheme{
  DarkTheme();

  ///main
  @override
  // TODO: implement primary
  Color get backgroundColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get formFieldBackgroundColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get enabledFormFieldBorderColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get focusedFormFieldBorderColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get appbarBackgroundColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get primaryColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get secondaryColor => const Color(0xff000000);

  ///selections
  @override
  // TODO: implement primary
  Color get successColor => const Color(0xff1a6513);

  @override
  // TODO: implement primary
  Color get dangerColor => const Color(0xff8f1818);

  @override
  // TODO: implement primary
  Color get infoColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get warningColor => const Color(0xffa95801);

  ///texts
  @override
  // TODO: implement primary
  Color get textColorPrimary => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get textColorSecondary => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get textCaptionColor => const Color(0xffb49f9f);

  ///icons
  @override
  // TODO: implement primary
  Color get iconPrimary => const Color(0xffffffff);

  ///card
  @override
  // TODO: implement primary
  Color get cardBackground => const Color(0xfff1ebeb);

  ///button
  @override
  // TODO: implement primary
  Color get buttonBackgroundColorPrimary => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get buttonBackgroundColorSecondary => const Color(0xff000000);

  ///constant colors
  @override
  // TODO: implement primary
  Color get white => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get black => const Color(0xff000000);
}