import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/presentation/screens/kanban/cubit/kanban_cubit.dart';
import 'package:kanban/presentation/screens/kanban/models/user_model.dart';

part 'kanban_form_state.dart';

class KanbanFormCubit extends Cubit<KanbanFormState> {
  KanbanFormCubit() : super(KanbanFormState.initialize());

  updateUser(UserModel user){
    emit(state.copyWith(user: user));
  }

  addTask(BuildContext context){

    BlocProvider.of<KanbanCubit>(context).addTask(
        state.user!,
        state.taskLabelController.text,
    );
    emit(KanbanFormState.initialize());
    Navigator.pop(context);
  }
}
