import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'hydrated_bloc_state.dart';

class HydratedBlocCubit extends HydratedCubit<DummyState> {
  HydratedBlocCubit() : super(DummyState.initialize());

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
