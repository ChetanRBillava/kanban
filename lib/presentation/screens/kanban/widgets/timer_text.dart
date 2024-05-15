import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/utils/app_texts.dart';
import 'package:kanban/presentation/utils/custom_print.dart';

class TimerText extends StatefulWidget {
  final String startTime, timeSpent;
  final int oldTime;
  const TimerText({super.key, required this.startTime, required this.timeSpent, required this.oldTime});

  @override
  State<TimerText> createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  Timer? timer;
  String time = '';

  @override
  void initState() {
    calc();
    super.initState();
  }

  calc(){
    setState(() {
      time = widget.timeSpent;
    });
    DateTime startTime = DateTime.parse(widget.startTime);

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      int diff = widget.oldTime + DateTime.now().difference(startTime).inSeconds;

      int hour = (diff/3600).floor();
      diff %= 3600;


      int minutes = (diff/60).floor();
      diff %= 60;

      time = '${hour<10?'0$hour':hour}:${minutes<10?'0$minutes':minutes}:${diff<10?'0$diff':diff}' ;

      setState(() {
        customPrint.myCustomPrint('Elapsed time: $time');
      });
    });


  }

  @override
  void dispose() {
    customPrint.myCustomPrint('Disposing now');
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return AppTexts.normalText(textProperties: TextProperties(text: time, textColor: appThemeState.themeClass.textColorPrimary));
      },
    );
  }
}