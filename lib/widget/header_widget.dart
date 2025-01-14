import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final String leftIcon;
  final String title;
  final String rightIcon;
  final bool isKeyboardOpen;
  const HeaderWidget(
      {super.key,
      required this.title,
      this.leftIcon = '',
      this.rightIcon = '',
      this.isKeyboardOpen = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 16),
        child: leftIcon.isNotEmpty
            ? CircleAvatar(
                backgroundColor: AppColors.main2,
                child: IconButton(
                  icon: SvgPicture.asset(leftIcon),
                  onPressed: () => {
                    isKeyboardOpen
                        ? FocusScope.of(context).unfocus()
                        : Navigator.of(context).pop()
                  },
                ),
              )
            : const SizedBox(),
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
