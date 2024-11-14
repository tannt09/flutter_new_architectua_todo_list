import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/core/storage/account_secure_storage.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            handleLogout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
