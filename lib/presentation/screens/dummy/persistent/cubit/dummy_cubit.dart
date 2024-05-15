import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'dummy_state.dart';

class DummyCubit extends HydratedCubit<DummyState> {
  DummyCubit() : super(DummyState.initialize());

  increment(){
    emit(state.copyWith(count: state.count + 1));
  }

  @override
  DummyState? fromJson(Map<String, dynamic> json) {
    final initialData = DummyState.fromMap(json);
    emit(initialData);
    return DummyState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DummyState state) {
    return state.toMap();
  }
}
