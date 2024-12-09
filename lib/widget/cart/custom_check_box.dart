import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final String title;
  final String assetIcon;
  final bool isCheck;
  const CustomCheckBoxWidget(
      {super.key,
      required this.title,
      required this.assetIcon,
      required this.isCheck});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              assetIcon,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: isCheck ? AppColors.black : AppColors.grey7),
              ),
            ),
            const Expanded(child: SizedBox()),
            SvgPicture.asset(
              isCheck
                  ? 'assets/icons/check_box_on_icon.svg'
                  : 'assets/icons/check_box_off_icon.svg',
              fit: BoxFit.cover,
            )
          ],
        ));
  }
}
