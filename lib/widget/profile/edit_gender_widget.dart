import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';

final List<String> genderList = ["Not Selected", "Male", "Female", "Other"];

class EditGenderWidget extends StatelessWidget {
  final int genderIndex;
  final Function(String? value) handleChanged;
  const EditGenderWidget(
      {super.key, required this.genderIndex, required this.handleChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          height: 40,
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButton<String>(
            value: genderList[genderIndex],
            items: genderList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: genderList[genderIndex] == value
                          ? Colors.black
                          : AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              );
            }).toList(),
            onChanged: handleChanged,
            underline: Container(height: 0),
            isExpanded: true,
            menuMaxHeight: 200,
          ),
        ),
      ],
    );
  }
}
