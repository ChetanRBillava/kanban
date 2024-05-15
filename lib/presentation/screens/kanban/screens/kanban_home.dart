import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/core/constants/images.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/router/app_router.dart';
import 'package:kanban/presentation/screens/kanban/cubit/kanban_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban/presentation/utils/app_texts.dart';

import 'package:kanban/presentation/screens/kanban/widgets/kanban_tile.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocBuilder<KanbanCubit, KanbanState>(
  builder: (context, kanbanState) {
    return SafeArea(
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
            body:kanbanState.tasks.isEmpty ? Center(
              child: AppTexts.headingText(textProperties: TextProperties(text: 'No tasks added')),
            ) : Column(
              children: [
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: kanbanState.tasks.length,
                    itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: KanbanTile(task: kanbanState.tasks[index],
                      index: index,),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                   return const SizedBox(height: 16,);
                },
                )
              ],
            ),

              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRouter.kanbanForm);
                },
                tooltip: 'Add Task',
                child: const Icon(Icons.add),
              ),
          ),
        );
  },
);
      },
    );
  }
}