import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/auth_api.dart';
import 'package:flutter_new_architectua/bloc/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginUser>(_loginUser);
    on<RegisterUser>(_registerUser);
  }

  Future<void> _loginUser(LoginUser events, Emitter<AuthState> emit) async {
    late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
    final AuthModel result = await loginUser(events.username, events.password);

    if (result.code == 200) {
      // Save the current token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      if (result.data != null && result.data!.token != null) {
        await prefs.setString('CURRENT_TOKEN', result.data!.token!);
      }
      navigator.push(const BottomNavigation());
    }

    emitSafety(state.copyWith(result: result));
  }

  Future<void> _registerUser(
      RegisterUser events, Emitter<AuthState> emit) async {
    final AuthModel result =
        await registerUser(events.username, events.password, events.email);

    emitSafety(state.copyWith(result: result));
  }
}
