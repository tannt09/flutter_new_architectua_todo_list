import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/auth/auth_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/core/storage/account_secure_storage.dart';
import 'package:flutter_new_architectua/widget/loading_dots_animation.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AuthBloc bloc = GetIt.instance.get<AuthBloc>();
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      handleLogin();
    });
  }

  Future<void> handleLogin() async {
    final [username, password] = await getAccount();
    if (username != null && password != null) {
      bloc.add(LoginUser(username: username, password: password));
    } else {
      navigator.replace(AuthRoute(title: 'Login'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.result.code != 200 && state.result.code != 400) {
            Future.delayed(const Duration(seconds: 2), () {
              handleLogin();
            });
          } else if (state.result.code == 400) {
            navigator.replace(AuthRoute(title: 'Login'));
          }
        },
        child: Scaffold(
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: LoadingDotsAnimation(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
