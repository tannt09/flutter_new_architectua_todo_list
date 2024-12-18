import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 26,
            backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
          ),
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hello!', style: TextStyle(fontSize: 12)),
            Text('John William',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
