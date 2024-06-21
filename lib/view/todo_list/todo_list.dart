import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/test/dog.dart';
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

    insertData();
    // updateData();
    // deleteData();

  }

  Future<void> insertData() async {
    var fido = Dog(id: 1, name: "Wold", age: 2);
    await Dog.insertDog(fido);
  }

  Future<void> updateData() async {
    var fido = Dog(id: 1, name: "Chiba", age: 2);
    await Dog.updateDog(fido);
  }

  Future<void> deleteData() async {
    await Dog.deleteDog(1);
  }

  Future<void> printDogList() async {
    print(await Dog.dogs());
  }

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
            Future<void> addItemToList(MyModel newItem, [int? index]) async {
              bloc.add(AddTodoList(item: newItem));
            }

            Future<void> editItemFromList(MyModel newItem, [int? index]) async {
              if (index != null) {
                bloc.add(EditTodoList(item: newItem, index: index));
              }
            }

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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(item.name),
                                Text("${item.age}"),
                                ElevatedButton(
                                  onPressed: () =>
                                      {bloc.add(DeleteTodoList(index: index))},
                                  child: const Icon(Icons.delete),
                                ),
                                ElevatedButton(
                                  onPressed: () => {
                                    CustomDialog.showAddItemDialog(
                                        context, editItemFromList, index)
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
                      // CustomDialog.showAddItemDialog(context, addItemToList)
                      printDogList()
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
