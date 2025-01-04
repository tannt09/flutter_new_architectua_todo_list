import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/core/storage/account_secure_storage.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/screen/ecommer/auth/auth_logic.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_new_architectua/widget/profile/custom_option_widget.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  Future<void> handleLogout() async {
    navigator.replace(AuthRoute(title: 'Login'));
    await deleteTokens();
    await deleteAccount();
    await database.delete('goods');

    // SignOut Firebase and Google
    await authFirebase.signOut();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
              ),
              CircleAvatar(
                radius: 46,
                backgroundImage: NetworkImage(changeImageLink(state
                            .profile.avatarUrl.isNotEmpty
                        ? state.profile.avatarUrl
                        : 'http://localhost:3000/images/1733114777827-default.png'))
                    as ImageProvider,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  state.profile.fullName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                state.profile.email ?? "",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey3),
              ),
              const SizedBox(
                height: 26,
              ),
              CustomOptionWidget(
                assetsIcon: 'assets/icons/profile_icon.svg',
                optionName: 'Profile',
                onPress: () {
                  navigator.push(const EditProfileRoute());
                },
              ),
              CustomOptionWidget(
                assetsIcon: 'assets/icons/setting_icon.svg',
                optionName: 'Setting',
                onPress: () {
                  navigator.push(const SettingRoute());
                },
              ),
              CustomOptionWidget(
                assetsIcon: 'assets/icons/contact_icon.svg',
                optionName: 'Contact',
                onPress: () {},
              ),
              CustomOptionWidget(
                assetsIcon: 'assets/icons/share_icon.svg',
                optionName: 'Share App',
                onPress: () {},
              ),
              CustomOptionWidget(
                  assetsIcon: 'assets/icons/help_icon.svg',
                  optionName: 'Help',
                  onPress: () {},
                  isShowArrow: false),
              const Expanded(child: SizedBox()),
              GestureDetector(
                  onTap: () {
                    handleLogout();
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange2),
                    ),
                  )),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      },
    ));
  }
}
