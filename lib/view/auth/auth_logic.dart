import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/bloc/auth/auth_bloc.dart';

class AuthLogic {
  Future<void> handleRegister(
      AuthBloc bloc, String username, String password, String email) async {
    bloc.add(
        RegisterUser(username: username, password: password, email: email));
  }

  Future<void> handleLogin(
      AuthBloc bloc, String username, String password) async {
    bloc.add(LoginUser(username: username, password: password));
  }

  static void handleAuth(
      AuthBloc bloc,
      String title,
      List<TextEditingController> controllers) { // Changed to List
    String username = controllers[0].text; // Access username
    String password = controllers[1].text; // Access password
    String email = controllers[2].text; // Access email if exists

    if (title == "Login") {
      AuthLogic().handleLogin(
        bloc,
        username,
        password,
      );
    } else {
      AuthLogic().handleRegister(
        bloc,
        username,
        password,
        email,
      );
    }
  }

  static void showResultDialog(BuildContext context, AuthState state) {
    if (state.result.message != null && state.result.message!.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Result'),
          content: Text(state.result.message ??
              'Error Register'), // Ensure non-null value
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
