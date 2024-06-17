part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends BaseBlocEvent {
  const TodoListEvent();
}

@freezed
class AddTodoList extends TodoListEvent with _$AddTodoList {
  const factory AddTodoList({required MyModel item}) = _AddTodoList;
}
