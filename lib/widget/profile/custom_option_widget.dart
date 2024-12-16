import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomOptionWidget extends StatelessWidget {
  final String? value;
  final bool isShowArrow;
  final String assetsIcon;
  final String optionName;
  final Function() onPress;

  const CustomOptionWidget(
      {super.key,
      required this.assetsIcon,
      required this.optionName,
      required this.onPress,
      this.isShowArrow = true,
      this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.main2),
        child: Row(
          children: [
            SvgPicture.asset(
              assetsIcon,
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              optionName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                value ?? '',
                style: const TextStyle(fontSize: 12),
              ),
            ),
            isShowArrow
                ? SvgPicture.asset(
                    'assets/icons/right_arrowhead_icon.svg',
                    width: 10,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                        AppColors.black, BlendMode.srcIn),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
