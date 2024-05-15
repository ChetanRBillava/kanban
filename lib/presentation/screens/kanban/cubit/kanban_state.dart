part of 'kanban_cubit.dart';

class KanbanState extends Equatable {
  final int generatedTask;
  final int currentTask;
  final int minCount;
  final List<KanbanStructure> kanbanColumns;

  const KanbanState({
    required this.generatedTask,
    required this.kanbanColumns,
    required this.currentTask,
    required this.minCount,
});

  factory KanbanState.initialize(){
    return KanbanState(
        kanbanColumns: [
          KanbanStructure(title: 'Pending', status: 'pending', tasks: [
            KanbanModel(
                id: 1,
                totalSeconds: 0,
                label: 'Task 1', timeSpent: '00:00:00',
                user: users[0], activeTime: '',
                status: 'pending', sessions: []),
            KanbanModel(
                id: 2,
                totalSeconds: 0,
                label: 'Task 2', timeSpent: '00:00:00',
                user: users[1], activeTime: '',
                status: 'pending', sessions: []),
            KanbanModel(
                id: 3,
                totalSeconds: 0,
                label: 'Task 3', timeSpent: '00:00:00',
                user: users[3], activeTime: '',
                status: 'pending', sessions: []),
          ],),
          KanbanStructure(title: 'In Progress', status: 'in progress', tasks: [
            KanbanModel(
                id: 4,
                totalSeconds: 0,
                label: 'Task 4', timeSpent: '00:00:00',
                user: users[3], activeTime: '',
                status: 'in progress', sessions: []),

          ]),
          KanbanStructure(title: 'Blocked', status: 'blocked', tasks: [
            KanbanModel(
                id: 5,
                totalSeconds: 0,
                label: 'Task 5', timeSpent: '00:00:00',
                user: users[2], activeTime: '',
                status: 'blocked', sessions: []),
            KanbanModel(
                id: 6,
                totalSeconds: 0,
                label: 'Task 6', timeSpent: '00:00:00',
                user: users[2], activeTime: '',
                status: 'blocked', sessions: []),
            KanbanModel(
                id: 7,
                totalSeconds: 0,
                label: 'Task 7', timeSpent: '00:00:00',
                user: users[1], activeTime: '',
                status: 'blocked', sessions: []),
            KanbanModel(
                id: 8,
                totalSeconds: 0,
                label: 'Task 8', timeSpent: '00:00:00',
                user: users[0], activeTime: '',
                status: 'blocked', sessions: []),

          ]),
          KanbanStructure(title: 'Completed', status: 'completed', tasks: [
            KanbanModel(
                id: 9,
                totalSeconds: 0,
                label: 'Task 9', timeSpent: '00:00:00',
                user: users[2], activeTime: '',
                status: 'completed', sessions: []),
            KanbanModel(
                id: 10,
                totalSeconds: 0,
                label: 'Task 10', timeSpent: '00:00:00',
                user: users[2], activeTime: '',
                status: 'completed', sessions: []),
          ]),
        ],
        currentTask: -1, generatedTask: 10, minCount: 5);
  }

  KanbanState copyWith({List<KanbanStructure>? kanbanColumns, int? currentTask, int? generatedTask, int? minCount}){
    return KanbanState(kanbanColumns: kanbanColumns ?? this.kanbanColumns, currentTask: currentTask ?? this.currentTask,
        generatedTask: generatedTask ?? this.generatedTask,
        minCount: minCount ?? this.minCount);
  }



  factory KanbanState.fromMap(Map<String, dynamic> map) {
    final List<KanbanStructure> list = (jsonDecode(map['tasks']) as List)
        .map((task) => KanbanStructure.fromJson(task))
        .toList();
    return KanbanState(
      generatedTask: jsonDecode(map['generatedTask']),
      currentTask: jsonDecode(map['currentTask']),
      minCount: jsonDecode(map['minCount']),
      kanbanColumns: list,
    );
  }

  Map<String, dynamic> toMap() {
    var json = jsonEncode(kanbanColumns.map((e) => e.toJson()).toList());
    return {
      'generatedTask': generatedTask,
      'currentTask': currentTask,
      'minCount': minCount,
      'tasks': json,
    };
  }



  @override
  List<Object> get props => [kanbanColumns, currentTask, minCount,generatedTask];
}