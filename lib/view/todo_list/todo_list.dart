import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/bloc/todo_list/todo_list_bloc.dart';
import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/view/count/count.dart';
import 'package:get_it/get_it.dart';

class TodoListPage extends StatefulWidget {
  static const String route = 'TodoListPage';

  final String title;
  const TodoListPage({super.key, required this.title});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final TodoListBloc bloc = GetIt.instance.get<TodoListBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: BlocBuilder<TodoListBloc, TodoListState>(
              builder: (context, state) {
            return ListView.builder(
                itemCount: state.myList.length,
                itemBuilder: (context, index) {
                  final item = state.myList[index];
                  return Center(
                    child: Text(item.name)
                  );
                });
          }),
          floatingActionButton: FloatingActionButton(
            // onPressed: () => navigator.pushNamed(CountPage.route),
            onPressed: () => bloc.add(const AddTodoList()),
            tooltip: 'Goto Count',
            child: const Icon(Icons.adobe),
          ),
        ));
  }
}
