import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/core/constants/images.dart';
import 'package:kanban_board/logic/cubit/app_theme_cubit.dart';
import 'package:kanban_board/presentation/router/app_router.dart';
import 'package:kanban_board/presentation/screens/kanban/cubit/kanban_cubit.dart';
import 'package:kanban_board/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban_board/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban_board/presentation/utils/app_texts.dart';

import 'package:kanban_board/presentation/screens/kanban/widgets/kanban_tile.dart';

class KanbanHome extends StatefulWidget {
  const KanbanHome({super.key});

  @override
  State<KanbanHome> createState() => _KanbanHomeState();
}

class _KanbanHomeState extends State<KanbanHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocBuilder<KanbanCubit, KanbanState>(
  builder: (context, kanbanState) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: appThemeState.themeClass.backgroundColor,
            appBar: AppBar(backgroundColor: appThemeState.themeClass.appbarBackgroundColor,automaticallyImplyLeading: false, title: AppTexts.headingText(textProperties: TextProperties(text: 'Kanban Board')),),
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