import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/auth_api.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/core/storage/account_secure_storage.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<GoogleLoginEvent>(_googleLogin);
  }
  @override
  AppNavigator get navigator => GetIt.instance.get<AppNavigator>();

  Future<void> _loginUser(
      LoginUserEvent events, Emitter<AuthState> emit) async {
    final AuthModel result = await loginUser(events.username, events.password);

    if (result.code == 200) {
      await saveAccount(events.username, events.password);
      if (result.data != null &&
          result.data!.accessToken != null &&
          result.data!.refreshToken != null) {
        await saveToken(result.data!.accessToken!, result.data!.refreshToken!);
        await storage.write(key: 'user_id', value: result.data!.userId);
      }
      navigator.replace(const BottomNavigation());
    }

    emitSafety(state.copyWith(result: result));
  }

  Future<void> _googleLogin(
      GoogleLoginEvent events, Emitter<AuthState> emit) async {
    final AuthModel result = await googleLogin(events.idToken);

    if (result.code == 200) {
      if (result.data != null &&
          result.data!.accessToken != null &&
          result.data!.refreshToken != null) {
        await saveToken(result.data!.accessToken!, result.data!.refreshToken!);
        await storage.write(key: 'user_id', value: result.data!.userId);
      }
      navigator.replace(const BottomNavigation());
    }

    emitSafety(state.copyWith(result: result));
  }

  Future<void> _registerUser(
      RegisterUserEvent events, Emitter<AuthState> emit) async {
    final AuthModel result =
        await registerUser(events.username, events.password, events.email);

    emitSafety(state.copyWith(result: result));
  }
}
