import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kanban/logic/cubit/app_theme_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_structure.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban/presentation/utils/custom_print.dart';

part 'kanban_state.dart';

class KanbanCubit extends HydratedCubit<KanbanState> {
  KanbanCubit() : super(KanbanState.initialize());

  addTask(UserModel user, String taskLabel,int newIndex){
    int minCount = 5;
    List<KanbanStructure> tempStructure = state.kanbanColumns;
    emit(state.copyWith(kanbanColumns: []));

    tempStructure[newIndex].tasks.add( KanbanModel(
        id: state.generatedTask+1,
        label: taskLabel,
        user: user,
        activeTime: '',
        status: tempStructure[newIndex].status,
        sessions: [], totalSeconds: 0, timeSpent: '00:00:00'
    ));
    tempStructure.forEach((element) {
      if(minCount < element.tasks.length){
        minCount = element.tasks.length;
      }
    });

    emit(state.copyWith(
        kanbanColumns: tempStructure,
        generatedTask: state.generatedTask + 1,
        minCount: minCount
    ));

  }

  dragUpdate(int taskIndex, int oldIndex, int newIndex){
    int minCount = 5;
    List<KanbanStructure> tempStructure = state.kanbanColumns;

    emit(state.copyWith(kanbanColumns: []));

    KanbanModel draggedTile = tempStructure[oldIndex].tasks[taskIndex];


    customPrint.myCustomPrint('Dragged from: ${tempStructure[oldIndex].status}');
    customPrint.myCustomPrint('Dragged to: ${tempStructure[newIndex].status}');
    customPrint.myCustomPrint('Dragged data index: $taskIndex');


    tempStructure[oldIndex].tasks.removeAt(taskIndex);
    draggedTile.status = tempStructure[newIndex].status;

    tempStructure[newIndex].tasks.add(draggedTile);

    for (var element in tempStructure) {
      if(minCount < element.tasks.length){
        minCount = element.tasks.length;
      }
    }

    emit(state.copyWith(kanbanColumns: tempStructure, minCount: minCount));
  }

  startTimer(int structureIndex, int taskIndex, int id){

    List<KanbanStructure> tempStructure = state.kanbanColumns;

    emit(state.copyWith(kanbanColumns: []));

    tempStructure[structureIndex].tasks[taskIndex].activeTime = DateTime.now().toString();

    emit(state.copyWith(currentTask: id, kanbanColumns: tempStructure,));
  }

  stopTimer(int structureIndex, int taskIndex, int id){
    List<KanbanStructure> tempStructure = state.kanbanColumns;

    emit(state.copyWith(kanbanColumns: []));


    DateTime startTime = DateTime.parse(tempStructure[structureIndex].tasks[taskIndex].activeTime),
        endTime = DateTime.now();
    int totalSeconds = tempStructure[structureIndex].tasks[taskIndex].totalSeconds +
        DateTime.now().difference(startTime).inSeconds;

    int diff = totalSeconds;
    String timeSpent = '';

    int hour = (diff/3600).floor();
    diff %= 3600;


    int minutes = (diff/60).floor();
    diff %= 60;

    timeSpent = '${hour<10?'0$hour':hour}:${minutes<10?'0$minutes':minutes}:${diff<10?'0$diff':diff}' ;

    List<Session> sessions = tempStructure[structureIndex].tasks[taskIndex].sessions;
    sessions.add(Session(startTime: tempStructure[structureIndex].tasks[taskIndex].activeTime,
        endTime: endTime.toString()));


    tempStructure[structureIndex].tasks[taskIndex].totalSeconds = totalSeconds;
    tempStructure[structureIndex].tasks[taskIndex].timeSpent = timeSpent;
    tempStructure[structureIndex].tasks[taskIndex].sessions = sessions;
    tempStructure[structureIndex].tasks[taskIndex].activeTime = '';

    emit(state.copyWith(currentTask: -1, kanbanColumns: tempStructure,));
  }

  /*updateStatus(int index, String status){
    List<KanbanModel> tasks = state.kanbanColumns;

    emit(state.copyWith(
      tasks: [],
    ));

    tasks[index].status = status;

    emit(state.copyWith(
        tasks: tasks,
    ));
  }*/

  @override
  KanbanState? fromJson(Map<String, dynamic> json) {
    final initialData = KanbanState.fromMap(json);
    emit(initialData);
    return KanbanState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(KanbanState state) {
    return state.toMap();
  }
}
