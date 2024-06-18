import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bloc/todo_list/todo_list_bloc.dart';

class CustomDialog {
  static Future<void> showAddItemDialog(
      BuildContext context, void Function(MyModel, [int?]) handleList, [int? index]) async {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerAge = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(hintText: "New Name"),
              ),
              TextField(
                controller: controllerAge,
                decoration: const InputDecoration(hintText: "New Age"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              )
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                handleList(MyModel(name: controllerName.text, age: int.parse(controllerAge.text)), index);
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
