import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_event.dart';
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
  }

  void _addElement(AddTodoList event, Emitter<TodoListState> emit) {
    final newList = List<MyModel>.from(state.myList)..add(MyModel(name: event.item.name, age: event.item.age));
    emit(state.copyWith(myList: newList));
  }

  void _deleteElement(DeleteTodoList event, Emitter<TodoListState> emit) {
    final newList = List<MyModel>.from(state.myList);
    newList.removeAt(event.index);
    emit(state.copyWith(myList: newList));
  }

  void _editElement(EditTodoList event, Emitter<TodoListState> emit) {
    final newList = List<MyModel>.from(state.myList);
    newList[event.index] = event.item;
    emit(state.copyWith(myList: newList));
  }
}
