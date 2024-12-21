import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double widthButton;
  final double heightButton;
  final Function()? onTap;
  const CustomButton(
      {super.key,
      required this.title,
      this.onTap,
      this.widthButton = double.infinity,
      this.heightButton = 50});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthButton,
        height: heightButton,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
