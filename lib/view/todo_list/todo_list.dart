import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/model/user_model.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:get_it/get_it.dart';

import '../../core/bloc/todo_list/todo_list_bloc.dart';
import '../../core/navigation/app_navigator.dart';
import '../../widget/custom_dialog.dart';

@RoutePage()
class TodoListPage extends StatefulWidget {
  final String title;
  const TodoListPage({super.key, this.title = "TodoList Screen"});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final TodoListBloc bloc = GetIt.instance.get<TodoListBloc>();

  @override
  void initState() {
    super.initState();
    // final child = SomeChild();
    // child.doSomeWork();

    // final dog = Dog();
    // print(dog.isAlive);
    // dog.eat();
    // dog.move();
    // dog.say();
    // print(dog);

    // final repository =  FakeWebServer();
    // final temperature = repository.fetchTemperature('London');
    // final temperature2 = repository.fetchTemperature2('London');
    // print(temperature);
    // print(temperature2);

    // print(0.toSex());
    // print(Sex.other.getRawValue());
  }

  // Future<void> updateData() async {
  //   var fido = Dog(id: 1, name: "Chiba", age: 2);
  //   await Dog.updateDog(fido);
  // }

  // Future<void> deleteData() async {
  //   await Dog.deleteDog(1);
  // }

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
            Future<void> addItemToList(User newItem, [int? id]) async {
              bloc.add(AddTodoList(item: newItem));
            }

            Future<void> editItemFromList(User newItem, [int? id]) async {
              bloc.add(EditTodoList(item: newItem));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.userList.length,
                      itemBuilder: (context, index) {
                        final item = state.userList[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(child: Text(item.name)),
                                Expanded(child: Text("${item.age}")),
                                ElevatedButton(
                                  onPressed: () =>
                                      {bloc.add(DeleteTodoList(id: item.id))},
                                  child: const Icon(Icons.delete),
                                ),
                                ElevatedButton(
                                  onPressed: () => {
                                    CustomDialog.showAddUserDialog(
                                        context, editItemFromList, item.id)
                                  },
                                  child: const Icon(Icons.edit),
                                )
                              ],
                            ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      CustomDialog.showAddUserDialog(context, addItemToList)
                    },
                    child: const Text('Add new item'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        {navigator.push(AdsRoute(title: "Ads Screen"))},
                    child: const Text('Goto Ads'),
                  ),
                ),
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                {navigator.push(CountRoute(title: "Count Screen"))},
            tooltip: 'Goto Count',
            child: const Icon(Icons.adobe),
          ),
        ));
  }
}
