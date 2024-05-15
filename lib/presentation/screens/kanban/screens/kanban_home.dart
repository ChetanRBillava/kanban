
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/core/constants/images.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/router/app_router.dart';
import 'package:kanban/presentation/screens/kanban/cubit/kanban_cubit.dart';
import 'package:kanban/presentation/screens/kanban/cubit/kanban_form_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban/presentation/utils/app_texts.dart';

import 'package:kanban/presentation/screens/kanban/widgets/kanban_tile.dart';
import 'package:kanban/presentation/utils/custom_print.dart';

class KanbanHome extends StatefulWidget {
  const KanbanHome({super.key});

  @override
  State<KanbanHome> createState() => _KanbanHomeState();
}

class _KanbanHomeState extends State<KanbanHome> {

  void showPicker(context) {
    //debugPrint("clicking..............");
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, appThemeState) {
              return SafeArea(
                child: Container(
                  child: Wrap(
                    children: <Widget>[
                      ///Kanban
                      ListTile(
                        tileColor: appThemeState.themeClass.appbarBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts.normalText(
                                textProperties: TextProperties(
                                    text: 'Kanban Reference'
                                )
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(AppRouter.kanbanReference);
                        },
                      ),
                      ///Drag and drop
                      ListTile(
                        tileColor: (appThemeState).themeClass.appbarBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts.normalText(
                                textProperties: TextProperties(
                                    text: 'Drag and Drop List reference'
                                )
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(AppRouter.dragAndDropReference);
                        },
                      ),
                      ///Draggable
                      ListTile(
                        tileColor: (appThemeState).themeClass.appbarBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts.normalText(
                                textProperties: TextProperties(
                                    text: 'Draggable and Drag Target reference'
                                )
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(AppRouter.draggableWidget);
                        },
                      ),
                      ///Hydrated
                      ListTile(
                        tileColor: (appThemeState).themeClass.appbarBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts.normalText(
                                textProperties: TextProperties(
                                    text: 'Hydrated Bloc'
                                )
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(AppRouter.hydratedBlocScreen);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
  
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocBuilder<KanbanCubit, KanbanState>(
          builder: (context, kanbanState) {
            return PopScope(
              canPop: false,
              onPopInvoked: (didPop){
                DateTime now = DateTime.now();
                if (currentBackPressTime == null ||
                    now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
                  currentBackPressTime = now;
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text('Press again to exit'),
                      )
                  );
                }
                else{
                  SystemNavigator.pop();
                }
              },
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: appThemeState.themeClass.backgroundColor,
                  appBar: AppBar(
                    backgroundColor: appThemeState.themeClass.appbarBackgroundColor,
                    automaticallyImplyLeading: false,
                    title: AppTexts.headingText(
                        textProperties: TextProperties(
                            text: 'Kanban Board'
                        )
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: (){
                            showPicker(context);
                          },
                          child: Icon(Icons.local_activity, color: appThemeState.themeClass.iconPrimary,),
                        ),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height:( kanbanState.minCount * 110)+10,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: kanbanState.kanbanColumns.length,
                            itemBuilder: (context, structureIndex){

                              if(kanbanState.kanbanColumns[structureIndex].tasks.isEmpty){
                                return DragTarget<List>(
                                    onAccept: (indexes) {
                                      BlocProvider.of<KanbanCubit>(context).dragUpdate(
                                          indexes[0],indexes[1], structureIndex
                                      );
                                    },
                                    builder: (context, candidateData, rejectedData) {
                                      return  Column(
                                        children: [
                                          KanbanHeader(
                                            title: kanbanState.kanbanColumns[structureIndex].title,
                                            status: kanbanState.kanbanColumns[structureIndex].status,
                                            index: structureIndex,
                                          ),
                                          const SizedBox(height: 45,),
                                          AppTexts.headingText(
                                              textProperties: TextProperties(
                                                  text: 'No task available'
                                              )
                                          )
                                        ],
                                      );
                                    }
                                );
                              }

                              return DragTarget<List>(
                                  onAccept: (indexes) {
                                    BlocProvider.of<KanbanCubit>(context).dragUpdate(
                                        indexes[0],indexes[1], structureIndex
                                    );
                                  },
                                  builder: (context, candidateData, rejectedData) {
                                  return SizedBox(
                                    width: 250,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: kanbanState.kanbanColumns[structureIndex].tasks.length,
                                      itemBuilder: (context, taskIndex){
                                        if(taskIndex==0){
                                          return Column(
                                            children: [
                                              KanbanHeader(
                                                title: kanbanState.kanbanColumns[structureIndex].title,
                                                status: kanbanState.kanbanColumns[structureIndex].status,
                                                index: structureIndex,
                                              ),
                                              SizedBox(height: 15,),
                                              Draggable(
                                                data: [taskIndex, structureIndex],
                                                feedback: Opacity(

                                                  opacity: 0.4,
                                                  child: KanbanTile(
                                                      structureIndex: structureIndex,
                                                      task: kanbanState.kanbanColumns[structureIndex].tasks[taskIndex],
                                                      taskIndex: taskIndex
                                                  ),
                                                ),
                                                child: KanbanTile(
                                                    structureIndex: structureIndex,
                                                    task: kanbanState.kanbanColumns[structureIndex].tasks[taskIndex],
                                                    taskIndex: taskIndex
                                                ),
                                              )
                                            ],
                                          );
                                        }

                                        return Draggable(
                                          data: [taskIndex, structureIndex],
                                          feedback: Opacity(

                                            opacity: 0.4,
                                            child: KanbanTile(
                                                structureIndex: structureIndex,
                                                task: kanbanState.kanbanColumns[structureIndex].tasks[taskIndex],
                                                taskIndex: taskIndex
                                            ),
                                          ),
                                          child: KanbanTile(
                                              structureIndex: structureIndex,
                                              task: kanbanState.kanbanColumns[structureIndex].tasks[taskIndex],
                                              taskIndex: taskIndex
                                          ),
                                        ) ;
                                      }, separatorBuilder: (context, index){
                                      return const SizedBox(height: 15,);
                                    },
                                    ),
                                  );
                                }
                              );
                            }, separatorBuilder: (context, index){
                          return const SizedBox(width: 15);
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class KanbanHeader extends StatelessWidget {
  const KanbanHeader({
    super.key,
    required this.title,
    required this.status,
    required this.index
  });

  final String title, status;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
  builder: (context, appThemeState) {
    return DottedBorder(
      color: appThemeState.themeClass.textColorPrimary,
      child: Container(
        width: 250,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTexts.labelText(
                  textProperties: TextProperties(
                      text: title,
                      textColor: appThemeState.themeClass.textColorPrimary
                  )
              ),
              GestureDetector(
                onTap: (){
                  BlocProvider.of<KanbanFormCubit>(context).setStatus(index);
                  Navigator.of(context).pushNamed(AppRouter.kanbanForm);
                },
                child: Icon(Icons.add, color: appThemeState.themeClass.iconPrimary,),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}