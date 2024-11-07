import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isValidInput;
  final bool obscureText;

  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.isValidInput,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          obscureText: obscureText,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: controller.text.isEmpty && !isValidInput
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    "Please enter $labelText",
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
        ),
      ],
    );
  }
}
