import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/todo_list/todo_list_bloc.dart';
import '../../navigation/app_navigator.dart';
import '../../widget/custom_dialog.dart';
import '../count/count.dart';

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
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.myList.length,
                      itemBuilder: (context, index) {
                        final item = state.myList[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: <Widget>[
                                Text(item.name),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Text("${item.age}")
                              ],
                            ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      CustomDialog.showAddItemDialog(context, bloc)
                    },
                    child: const Text('Add new item'),
                  ),
                ),
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => navigator.pushNamed(CountPage.route),
            tooltip: 'Goto Count',
            child: const Icon(Icons.adobe),
          ),
        ));
  }
}
