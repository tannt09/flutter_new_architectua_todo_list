part of 'todo_list_bloc.dart';

@freezed
class TodoListState extends BaseBlocState with _$TodoListState {
  const factory TodoListState({
    @Default(<User>[])
    List<User> userList,
  }) = _TodoListState;
}
