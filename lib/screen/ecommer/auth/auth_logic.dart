import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_new_architectua/core/bloc/auth/auth_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('AuthLogic');

class AuthLogic {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  Future<void> handleRegister(
      AuthBloc bloc, String username, String password, String email) async {
    bloc.add(RegisterUserEvent(
        username: username, password: password, email: email));
  }

  Future<void> handleLogin(
      AuthBloc bloc, String username, String password) async {
    bloc.add(LoginUserEvent(username: username, password: password));
  }

  static void handleAuth(
      AuthBloc bloc, String title, List<TextEditingController> controllers) {
    // Changed to List
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

  static Future<void> handleLoginWithGoogle(AuthBloc bloc) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // Login with Google
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credential from Google
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login Firebase
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final String? idTokenFirebase =
          await userCredential.user?.getIdToken(true);

      if (idTokenFirebase != null) {
        bloc.add(GoogleLoginEvent(idToken: idTokenFirebase));
      }
    } catch (e) {
      _logger.info('----Login fail: $e');
    }
  }

  static void showResultLoginDialog(BuildContext context, AuthState state) {
    if (state.result.code != 200) {
      if (state.result.message != null && state.result.message!.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Result'),
            content:
                Text(state.result.message ?? 'Error'), // Ensure non-null value
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

  static void showResultRegisterDialog(BuildContext context, AuthState state) {
    if (state.result.message != null && state.result.message!.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Result'),
          content:
              Text(state.result.message ?? 'Error'), // Ensure non-null value
          actions: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                if (state.result.code == 200)
                  {
                    AuthLogic().navigator.replace(AuthRoute(title: 'Login')),
                  }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
