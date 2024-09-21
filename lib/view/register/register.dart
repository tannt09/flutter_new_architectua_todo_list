import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/bloc/register/register_bloc.dart';
import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/navigation/app_router.gr.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  final String title;

  const RegisterPage({super.key, this.title = "Login"});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final RegisterBloc bloc = GetIt.instance.get<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<RegisterBloc, RegisterState>(
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
                            // Implement register functionality
                            bloc.add(RegisterUser(
                              username: usernameController.text,
                              password: passwordController.text,
                              email: emailController.text,
                            ));
                          },
                          child: Text(widget.title),
                        ),
                        const SizedBox(height: 16),
                        if (widget.title == "Login") // Add this condition
                          GestureDetector(
                            onTap: () {
                              navigator.push(RegisterRoute(title: "Register"));
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
    );
  }
}
