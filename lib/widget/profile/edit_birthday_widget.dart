import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:intl/intl.dart';

class EditBirthdayWidget extends StatelessWidget {
  final Function(BuildContext context) selectDate;
  final DateTime? selectedDate;
  const EditBirthdayWidget(
      {super.key, required this.selectDate, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Birthday',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
            onTap: () => selectDate(context),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Chưa chọn ngày"
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ))),
      ],
    );
  }
}
