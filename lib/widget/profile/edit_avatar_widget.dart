import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditAvatarWidget extends StatelessWidget {
  final String avatarUrl;
  const EditAvatarWidget({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: SvgPicture.asset('assets/icons/camera_icon.svg'),
          )
        ],
      ),
    );
  }
}
