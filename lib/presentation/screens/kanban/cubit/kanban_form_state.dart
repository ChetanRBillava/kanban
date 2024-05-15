part of 'kanban_form_cubit.dart';

class KanbanFormState extends Equatable {
  final TextEditingController taskLabelController;
  final UserModel? user;
  final int index;

  const KanbanFormState({
    required this.taskLabelController,
    required this.user,
    required this.index
});

  factory KanbanFormState.initialize(){
    return KanbanFormState(
      taskLabelController: TextEditingController(),
      user: null,
        index: 0
    );
  }

  KanbanFormState copyWith({TextEditingController? taskLabelController,
    UserModel? user, int? index}){
    return KanbanFormState(
        taskLabelController: taskLabelController ?? this.taskLabelController,
        user: user ?? this.user,
        index: index ?? this.index
    );
}
  @override
  List<Object?> get props => [taskLabelController, user, index];
}