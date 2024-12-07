import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final String leftIcon;
  final String title;
  final String rightIcon;
  const HeaderWidget(
      {super.key,
      required this.leftIcon,
      required this.title,
      this.rightIcon = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          backgroundColor: AppColors.main2,
          child: IconButton(
            icon: SvgPicture.asset(leftIcon),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      leadingWidth: 60,
      actions: [
        rightIcon.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(right: 20),
                width: 40,
                child: CircleAvatar(
                  backgroundColor: AppColors.main2,
                  child: IconButton(
                    icon: SvgPicture.asset(rightIcon),
                    onPressed: () => {},
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
