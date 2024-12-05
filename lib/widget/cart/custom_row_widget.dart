import 'package:flutter/widgets.dart';
import 'package:flutter_new_architectua/constants/colors.dart';

class CustomRowWidget extends StatelessWidget {
  final String name;
  final String value;
  const CustomRowWidget({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 4, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: AppColors.black, fontSize: 14),),
          Text(value),
        ],
      ),
    );
  }
}
