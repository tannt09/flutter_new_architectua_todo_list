import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_bloc.dart';
import '../../base/bloc/base_bloc_state.dart';

part 'todo_list_bloc.freezed.dart';
part 'todo_list_event.dart';
part 'todo_list_state.dart';

@injectable
class TodoListBloc extends BaseBloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(const TodoListState()) {
    on<AddTodoList>(_addElement);
    on<DeleteTodoList>(_deleteElement);
    on<EditTodoList>(_editElement);
    on<UpdateTodoList>(_updateTodoList);

    _initializeState();
  }

  Future<void> _initializeState() async {
    add(const UpdateTodoList());
  }

  Future<void> _updateTodoList(UpdateTodoList event, Emitter<TodoListState> emit) async {
    final List<User> newList = await User.users();
    emit(state.copyWith(userList: newList));
  }

  Future<void> _addElement(AddTodoList event, Emitter<TodoListState> emit) async {
    var fido = User(id: event.item.id, name: event.item.name, age: event.item.age);
    await User.insertUser(fido);

    add(const UpdateTodoList());
    // final newList = List<User>.from(state.userList)
    // ..add(User(name: event.item.name, age: event.item.age, id: event.item.id));
    // emit(state.copyWith(userList: newList));
  }

  void _deleteElement(DeleteTodoList event, Emitter<TodoListState> emit) {
    final newList = List<User>.from(state.userList);
    newList.removeAt(event.index);
    emit(state.copyWith(userList: newList));
  }

  void _editElement(EditTodoList event, Emitter<TodoListState> emit) {
    final newList = List<User>.from(state.userList);
    newList[event.index] = event.item;
    emit(state.copyWith(userList: newList));
  }
}
