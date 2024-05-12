part of 'kanban_form_cubit.dart';

class KanbanFormState extends Equatable {
  final TextEditingController taskLabelController;
  final UserModel? user;

  const KanbanFormState({
    required this.taskLabelController,
    required this.user
});

  factory KanbanFormState.initialize(){
    return KanbanFormState(
      taskLabelController: TextEditingController(),
      user: null,
    );
  }

  KanbanFormState copyWith({TextEditingController? taskLabelController,
    UserModel? user}){
    return KanbanFormState(
        taskLabelController: taskLabelController ?? this.taskLabelController,
        user: user ?? this.user
    );
}
  @override
  List<Object?> get props => [taskLabelController, user];
}