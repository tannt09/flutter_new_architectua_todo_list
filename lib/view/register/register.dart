import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/bloc/register/register_bloc.dart';
import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/navigation/app_router.gr.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  final String title;

  const RegisterPage({super.key, this.title = "Login"});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final Logger _logger = Logger('RegisterPage');

  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final RegisterBloc bloc = GetIt.instance.get<RegisterBloc>();

  @override
  void initState() {
    super.initState();
    Logger.root.level = Level.ALL; // Set the root logger level
    Logger.root.onRecord.listen((record) {
      // You can customize the log output format here
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> handleRegister(
      String username, String password, String email) async {
    bloc.add(
        RegisterUser(username: username, password: password, email: email));
  }

  Future<void> handleLogin(String username, String password) async {
    _logger.info("----1111 $username");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.result.isNotEmpty) {
              // Display the result in a dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Result'),
                  content: Text(state.result),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
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
                          TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          if (widget.title != "Login")
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              // Check if the title is "Login" to determine the action
                              if (widget.title == "Login") {
                                handleLogin(
                                  usernameController.text,
                                  passwordController.text,
                                );
                              } else {
                                handleRegister(
                                  usernameController.text,
                                  passwordController.text,
                                  emailController.text,
                                );
                              }
                            },
                            child: Text(widget.title),
                          ),
                          const SizedBox(height: 16),
                          if (widget.title == "Login")
                            GestureDetector(
                              onTap: () {
                                navigator
                                    .push(RegisterRoute(title: "Register"));
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
