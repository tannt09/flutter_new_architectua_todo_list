import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_architectua/model/product_model.dart';
import 'package:flutter_new_architectua/model/user_model.dart';

class CustomDialog {
  static Future<void> showAddUserDialog(
      BuildContext context, void Function(User, [int?]) handleList,
      [int? id]) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "New Name"),
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(hintText: "New Age"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                if (id != null) {
                  handleList(User(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      id: id));
                } else {
                  handleList(User(
                      name: nameController.text,
                      age: int.parse(ageController.text),
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
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController originalPriceController = TextEditingController();
    TextEditingController discountPercentageController = TextEditingController();
    TextEditingController discountedPriceController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "New Title"),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: "New Description"),
                ),
                TextField(
                  controller: originalPriceController,
                  decoration: const InputDecoration(hintText: "New Original Price"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                TextField(
                  controller: discountPercentageController,
                  decoration: const InputDecoration(hintText: "New Discount Percentage"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                TextField(
                  controller: discountedPriceController,
                  decoration: const InputDecoration(hintText: "New Discounted Price"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                handleList(Product(
                    title: titleController.text,
                    originalPrice: int.tryParse(originalPriceController.text),
                    id: id,
                    description: descriptionController.text,
                    discountPercentage: int.tryParse(discountPercentageController.text),
                    discountedPrice: int.tryParse(discountedPriceController.text)));

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
