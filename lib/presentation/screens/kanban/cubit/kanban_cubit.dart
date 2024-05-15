import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kanban/presentation/screens/kanban/models/kanban_model.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';
import 'package:kanban/presentation/utils/custom_print.dart';

part 'kanban_state.dart';

class KanbanCubit extends HydratedCubit<KanbanState> {
  KanbanCubit() : super(KanbanState.initialize());

  addTask(UserModel user, String taskLabel){
    List<KanbanModel> tasks = [];

    for (var element in state.tasks) {
      tasks.add(element);
    }

    tasks.add(
        KanbanModel(
            id: state.generatedTask+1,
            label: taskLabel,
            user: user,
            activeTime: '',
            status: 'pending',
            sessions: [], totalSeconds: 0, timeSpent: '00:00:00'
        ),
    );

    emit(state.copyWith(
        tasks: tasks,
        generatedTask: state.generatedTask + 1
    ));
  }

  updateStatus(int index, String status){
    List<KanbanModel> tasks = state.tasks;

    emit(state.copyWith(
      tasks: [],
    ));

    tasks[index].status = status;

    emit(state.copyWith(
        tasks: tasks,
    ));
  }

  startTimer(int index, int id){
    List<KanbanModel> tasks = state.tasks;

    emit(state.copyWith(
      tasks: [],
    ));

    tasks[index].activeTime = DateTime.now().toString();

    emit(state.copyWith(currentTask: id, tasks: tasks,));
  }

  stopTimer(int index, int id){
    List<KanbanModel> tasks = state.tasks;

    emit(state.copyWith(
      tasks: [],
    ));


    DateTime startTime = DateTime.parse(tasks[index].activeTime),
        endTime = DateTime.now();
    int totalSeconds = tasks[index].totalSeconds +
        DateTime.now().difference(startTime).inSeconds;

    int diff = totalSeconds;
    String timeSpent = '';

    int hour = (diff/3600).floor();
    diff %= 3600;


    int minutes = (diff/60).floor();
    diff %= 60;

    timeSpent = '${hour<10?'0$hour':hour}:${minutes<10?'0$minutes':minutes}:${diff<10?'0$diff':diff}' ;

    List<Session> sessions = tasks[index].sessions;
    sessions.add(Session(startTime: tasks[index].activeTime,
        endTime: endTime.toString()));


    tasks[index].totalSeconds = totalSeconds;
    tasks[index].timeSpent = timeSpent;
    tasks[index].sessions = sessions;
    tasks[index].activeTime = '';

    emit(state.copyWith(currentTask: -1, tasks: tasks,));
  }

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
