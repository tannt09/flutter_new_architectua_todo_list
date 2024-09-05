import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_architectua/model/product.dart';
import 'package:flutter_new_architectua/model/user.dart';

class CustomDialog {
  static Future<void> showAddUserDialog(
      BuildContext context, void Function(User, [int?]) handleList,
      [int? id]) async {
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
                  handleList(User(
                      name: controllerName.text,
                      age: int.parse(controllerAge.text),
                      id: id));
                } else {
                  handleList(User(
                      name: controllerName.text,
                      age: int.parse(controllerAge.text),
                      id: Random().nextInt(100)));
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

  static Future<void> showAddProductDialog(
      BuildContext context, void Function(Product) handleList,
      [String? id]) async {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerPrice = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: controllerTitle,
                decoration: const InputDecoration(hintText: "New Title"),
              ),
              TextField(
                controller: controllerPrice,
                decoration: const InputDecoration(hintText: "New Price"),
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
                handleList(Product(
                    title: controllerTitle.text,
                    original_price: int.parse(controllerPrice.text),
                    id: id,
                    description: '',
                    discount_percentage: 0,
                    discounted_price: 0));

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
