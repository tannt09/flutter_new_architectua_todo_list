import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_architectua/model/user.dart';


class CustomDialog {
  static Future<void> showAddItemDialog(
      BuildContext context, void Function(User, [int?]) handleList, [int? id]) async {
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
                if (id != null) {
                  handleList(User(name: controllerName.text, age: int.parse(controllerAge.text), id: id));
                } else {
                  handleList(User(name: controllerName.text, age: int.parse(controllerAge.text), id: Random().nextInt(100)));
                }
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
