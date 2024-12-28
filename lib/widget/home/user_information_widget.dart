import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/profile_model.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInformationWidget extends StatelessWidget {
  final ProfileModel profile;
  const UserInformationWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(changeImageLink(profile
                        .avatarUrl.isNotEmpty
                    ? profile.avatarUrl
                    : 'http://localhost:3000/images/1733114777827-default.png'))
                as ImageProvider,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Hello!', style: TextStyle(fontSize: 12)),
            Text(profile.fullName,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
        const Expanded(child: SizedBox()),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.main2,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 10, 10, 10),
            child: SvgPicture.asset('assets/icons/bell_icon.svg'),
          ),
        ),
      ],
    );
  }
}
