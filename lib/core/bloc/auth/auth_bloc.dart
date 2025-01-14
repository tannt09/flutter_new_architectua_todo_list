import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<VerifyIdTokenEvent>(_verifyToken);
    on<SetLoadingEvent>(_setLoading);
  }
  @override
  AppNavigator get navigator => GetIt.instance.get<AppNavigator>();

  Future<void> _loginUser(
      LoginUserEvent events, Emitter<AuthState> emit) async {
    emitSafety(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
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
      await Future.delayed(const Duration(milliseconds: 100));

      emitSafety(state.copyWith(isLoading: false));
    } else {
      emitSafety(state.copyWith(isLoading: false));
    }

    emitSafety(state.copyWith(result: result));
  }

  Future<void> _verifyToken(
      VerifyIdTokenEvent events, Emitter<AuthState> emit) async {
    final AuthModel result = await googleLogin(events.idToken);

    if (result.code == 200) {
      if (result.data != null &&
          result.data!.accessToken != null &&
          result.data!.refreshToken != null) {
        await saveToken(result.data!.accessToken!, result.data!.refreshToken!);
        await storage.write(key: 'user_id', value: result.data!.userId);
      }
      navigator.replace(const BottomNavigation());
      await Future.delayed(const Duration(milliseconds: 100));
      emitSafety(state.copyWith(isLoading: false));
    } else {
      emitSafety(state.copyWith(isLoading: false));
    }

    emitSafety(state.copyWith(result: result));
  }

  Future<void> _registerUser(
      RegisterUserEvent events, Emitter<AuthState> emit) async {
    final AuthModel result =
        await registerUser(events.username, events.password, events.email);

    emitSafety(state.copyWith(result: result));
  }

  Future<void> _setLoading(
      SetLoadingEvent events, Emitter<AuthState> emit) async {
    emitSafety(state.copyWith(isLoading: events.isLoading));
  }
}
