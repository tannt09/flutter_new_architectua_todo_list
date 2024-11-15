import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/auth/auth_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/screen/ecommer/auth/auth_logic.dart';
import 'package:flutter_new_architectua/widget/custom_textfield.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  final String title;

  const AuthPage({super.key, this.title = "Login"});

  @override
  State<AuthPage> createState() => _AuthState();
}

class _AuthState extends State<AuthPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isValidInput = true;

  @override
  void initState() {
    super.initState();
    Logger.root.level = Level.ALL; // Set the root logger level
    Logger.root.onRecord.listen((record) {
      // You can customize the log output format here
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  void _updateIsValidInput() {
    setState(() {
      if (widget.title == "Login") {
        isValidInput = usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      } else {
        isValidInput = usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            emailController.text.isNotEmpty;
      }
    });
  }

  // final Logger _logger = Logger('AuthPage');

  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final AuthBloc bloc = GetIt.instance.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (widget.title == "Login") {
              AuthLogic.showResultLoginDialog(context, state);
            } else {
              AuthLogic.showResultRegisterDialog(context, state);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CustomTextfield(
                              controller: usernameController,
                              labelText: "Username",
                              isValidInput: isValidInput),
                          CustomTextfield(
                              controller: passwordController,
                              labelText: "Password",
                              obscureText: true,
                              isValidInput: isValidInput),
                          if (widget.title != "Login")
                            CustomTextfield(
                                controller: emailController,
                                labelText: "Email",
                                isValidInput: isValidInput),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              _updateIsValidInput();
                              if (isValidInput) {
                                AuthLogic.handleAuth(bloc, widget.title, [
                                  usernameController,
                                  passwordController,
                                  emailController
                                ]);
                              }
                            },
                            child: Text(widget.title),
                          ),
                          const SizedBox(height: 16),
                          if (widget.title == "Login")
                            GestureDetector(
                              onTap: () {
                                navigator.push(AuthRoute(title: "Register"));
                              },
                              child: const Text(
                                'Go to Register',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}