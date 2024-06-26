part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends BaseBlocEvent {
  const TodoListEvent();
}

@freezed
class AddTodoList extends TodoListEvent with _$AddTodoList {
  const factory AddTodoList({required MyModel item}) = _AddTodoList;
}

@freezed
class DeleteTodoList extends TodoListEvent with _$DeleteTodoList {
  const factory DeleteTodoList({required int index}) = _DeleteTodoList;
}

@freezed
class EditTodoList extends TodoListEvent with _$EditTodoList {
  const factory EditTodoList({required MyModel item, required int index}) = _EditTodoList;
}
