part of 'kanban_cubit.dart';

class KanbanState extends Equatable {
  final int generatedTask;
  final int currentTask;
  final List<KanbanModel> tasks;
  
  const KanbanState({
    required this.generatedTask,
    required this.tasks,
    required this.currentTask,
});

  factory KanbanState.initialize(){
    return const KanbanState(tasks: [], currentTask: -1, generatedTask: 0);
  }

  KanbanState copyWith({List<KanbanModel>? tasks, int? currentTask, int? generatedTask}){
    return KanbanState(tasks: tasks ?? this.tasks, currentTask: currentTask ?? this.currentTask,
        generatedTask: generatedTask ?? this.generatedTask);
  }



  factory KanbanState.fromMap(Map<String, dynamic> map) {
    final List<KanbanModel> list = (jsonDecode(map['tasks']) as List)
        .map((task) => KanbanModel.fromJson(task))
        .toList();
    return KanbanState(
      generatedTask: jsonDecode(map['generatedTask']),
      currentTask: jsonDecode(map['currentTask']),
      tasks: list,
    );
  }

  Map<String, dynamic> toMap() {
    var json = jsonEncode(tasks.map((e) => e.toJson()).toList());
    return {
      'generatedTask': generatedTask,
      'currentTask': currentTask,
      'tasks': json,
    };
  }



  @override
  List<Object> get props => [tasks, currentTask, generatedTask];
}