part of 'todo_list_bloc.dart';

class MyModel {
  final String name;
  final int age;

  MyModel({required this.name, required this.age});
}

@freezed
class TodoListState extends BaseBlocState with _$TodoListState {
  const factory TodoListState({
    @Default(<MyModel>[])
    List<MyModel> myList,
  }) = _TodoListState;
}
