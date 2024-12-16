import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';
import 'package:flutter_new_architectua/widget/profile/custom_option_widget.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeaderWidget(
            leftIcon: 'assets/icons/left_arrow_icon.svg', title: 'Settings'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Account',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.main2),
                child: Row(
                  children: [
                    const SizedBox(width: 2),
                    const CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/id/237/200/300'),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mark Adam',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sunny_Koelpin45@hotmail.com',
                          style: TextStyle(
                              color: AppColors.grey3,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: SvgPicture.asset(
                        'assets/icons/right_arrowhead_icon.svg',
                        width: 10,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                            AppColors.black, BlendMode.srcIn),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  color: AppColors.grey,
                  height: 2,
                ),
              ),
              const Text(
                'Setting',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomOptionWidget(
                  assetsIcon: 'assets/icons/bell_icon.svg',
                  optionName: 'Notification',
                  onPress: () {}),
              CustomOptionWidget(
                  assetsIcon: 'assets/icons/language_icon.svg',
                  optionName: 'Language',
                  value: 'English',
                  onPress: () {}),
              CustomOptionWidget(
                  assetsIcon: 'assets/icons/privacy_icon.svg',
                  optionName: 'Privacy',
                  onPress: () {}),
              CustomOptionWidget(
                  assetsIcon: 'assets/icons/help_center_icon.svg',
                  optionName: 'Help Center',
                  onPress: () {}),
              CustomOptionWidget(
                  assetsIcon: 'assets/icons/about_us_icon.svg',
                  optionName: 'About us',
                  onPress: () {}),
            ],
          ),
        ));
  }
}
