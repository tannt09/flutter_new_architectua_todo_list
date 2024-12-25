import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter_new_architectua/constants/colors.dart';

class EditCountryWidget extends StatelessWidget {
  final String region;
  final Function(Country country) handleSelect;
  const EditCountryWidget(
      {super.key, required this.region, required this.handleSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Country/Region',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              onSelect: handleSelect,
              moveAlongWithKeyboard: false,
            );
          },
          child: Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    region,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              )),
        ),
      ],
    );
  }
}
