import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/todo_list/todo_list_bloc.dart';
import '../../navigation/app_navigator.dart';

@RoutePage()
class TodoListGraphQLPage extends StatefulWidget {
  final String title;
  const TodoListGraphQLPage({super.key, this.title = "TodoList Screen"});

  @override
  State<TodoListGraphQLPage> createState() => _TodoListGraphQLPageState();
}

class _TodoListGraphQLPageState extends State<TodoListGraphQLPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final TodoListBloc bloc = GetIt.instance.get<TodoListBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Center(
          child: Column(children: <Widget>[
            Spacer(),
            Text("Test GraphQL"),
          ],),
        ));
  }
}
