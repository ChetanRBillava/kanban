part of 'hydrated_bloc_cubit.dart';

class DummyState extends Equatable {
  final int count;

  const DummyState({required this.count});

  factory DummyState.initialize(){
    return const DummyState(count: 0);
  }

  DummyState copyWith({int? count}){
    return DummyState(count: count ?? this.count);
  }
  


factory DummyState.fromMap(Map<String, dynamic> json) => DummyState(
    count: json['count'],
  );

  Map<String, dynamic> toMap() => {
    'count': count,
  };



  @override
  List<Object> get props => [count];
}