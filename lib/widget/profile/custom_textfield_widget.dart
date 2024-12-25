import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_architectua/constants/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isEnterNumberOnly;
  const CustomTextFieldWidget(
      {super.key,
      required this.controller,
      required this.label,
      this.isEnterNumberOnly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(top: 4, bottom: 6),
          child: TextField(
            controller: controller,
            inputFormatters: isEnterNumberOnly
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: AppColors.grey),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black,
                ),
              ),
              border: const OutlineInputBorder(),
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
