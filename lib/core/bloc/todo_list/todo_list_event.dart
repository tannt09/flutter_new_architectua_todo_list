part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends BaseBlocEvent {
  const TodoListEvent();
}

@freezed
class UpdateTodoList extends TodoListEvent with _$UpdateTodoList {
  const factory UpdateTodoList() = _UpdateTodoList;
}

@freezed
class AddTodoList extends TodoListEvent with _$AddTodoList {
  const factory AddTodoList({required User item}) = _AddTodoList;
}

@freezed
class DeleteTodoList extends TodoListEvent with _$DeleteTodoList {
  const factory DeleteTodoList({required int id}) = _DeleteTodoList;
}

@freezed
class EditTodoList extends TodoListEvent with _$EditTodoList {
  const factory EditTodoList({required User item}) = _EditTodoList;
}
