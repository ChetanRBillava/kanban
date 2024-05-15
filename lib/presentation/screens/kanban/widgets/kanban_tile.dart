import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/screens/kanban/cubit/kanban_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/widgets/timer_text.dart';
import 'package:kanban/presentation/utils/app_texts.dart';
import 'package:kanban/presentation/utils/custom_print.dart';

class KanbanTile extends StatelessWidget {
  final int taskIndex, structureIndex;
  final KanbanModel task;
  final String? status;
  const KanbanTile({
    super.key,
    required this.task,
    required this.structureIndex,
    required this.taskIndex,
    this.status
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocBuilder<KanbanCubit, KanbanState>(
  builder: (context, kanbanState) {
    return Container(
          width: 250,
          padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: appThemeState.themeClass.cardBackground,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 150, child: AppTexts.labelText(
                    textProperties: TextProperties(
                        text: task.label,
                        textColor: appThemeState.themeClass.textColorPrimary),
                  )),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
                          child: Image.asset(task.user.image, width: 24, height: 24,)),
                      const SizedBox(width: 8),
                      AppTexts.normalText(
                        textProperties: TextProperties(
                            text: task.user.name,
                            textColor: appThemeState.themeClass.textColorPrimary
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Row(
                    children: [
                      kanbanState.currentTask==task.id?
                      TimerText(startTime: task.activeTime,
                        oldTime: task.totalSeconds,
                        timeSpent: task.timeSpent,
                      ):
                      AppTexts.normalText(
                          textProperties: TextProperties(
                              text: task.timeSpent,
                              textColor: appThemeState.themeClass.textColorPrimary
                          )
                      ),

                      kanbanState.currentTask==task.id?
                      GestureDetector(
                          onTap: (){

                            BlocProvider.of<KanbanCubit>(context).stopTimer(
                              structureIndex,
                              taskIndex,
                              task.id,
                            );
                          },
                          child: Icon(Icons.stop, color: appThemeState.themeClass.dangerColor,),
                      ):
                      GestureDetector(
                          onTap: (){
                            if(kanbanState.currentTask!=-1){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 3),
                                    content: AppTexts.headingText(
                                        textProperties: TextProperties(
                                            text: 'Please Stop the previous task!!!')
                                    ),
                                  )
                              );
                            }
                            else{
                              BlocProvider.of<KanbanCubit>(context).startTimer(
                                structureIndex,
                                taskIndex,
                                task.id,
                              );
                            }

                          },
                          child: Icon(
                            Icons.play_arrow,
                            color: appThemeState.themeClass.successColor,
                          )
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),


                  AppTexts.normalText(
                    textProperties: TextProperties(
                        text: /*status??*/task.status,
                        textColor: appThemeState.themeClass.textColorPrimary
                    ),
                  )

                  /*DropdownButton(
                    value: task.status,
                    underline: const SizedBox(),
                    items: [
                      DropdownMenuItem(
                          value: 'pending',
                          child: AppTexts.normalText(textProperties: TextProperties(
                              text: 'pending',
                              textColor: appThemeState.themeClass.textColorSecondary))),
                      DropdownMenuItem(
                          value: 'in progress',
                          child: AppTexts.normalText(textProperties: TextProperties(
                              text: 'in progress',
                              textColor: appThemeState.themeClass.textColorSecondary))),
                      DropdownMenuItem(
                          value: 'blocked',
                          child: AppTexts.normalText(textProperties: TextProperties(
                              text: 'blocked',
                              textColor: appThemeState.themeClass.textColorSecondary))),
                      DropdownMenuItem(
                          value: 'completed',
                          child: AppTexts.normalText(textProperties: TextProperties(
                              text: 'completed',
                              textColor: appThemeState.themeClass.textColorSecondary))),
                    ],
                    onChanged: (value) {

                      BlocProvider.of<KanbanCubit>(context).updateStatus(
                        index,
                        value!,
                      );
                    },
                  ),*/
                ],
              )
            ],
          ),
        );
  },
);
      },
    );
  }
}