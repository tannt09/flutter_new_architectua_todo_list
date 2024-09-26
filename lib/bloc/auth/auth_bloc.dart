import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/auth_api.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginUser>(_loginUser);
    on<RegisterUser>(_registerUser);
  }

  Future<void> _loginUser(LoginUser events, Emitter<AuthState> emit) async {
    final AuthModel result = await loginUser(events.username, events.password);
    emit(state.copyWith(result: result));
  }

  Future<void> _registerUser(
      RegisterUser events, Emitter<AuthState> emit) async {
    final AuthModel result =
        await registerUser(events.username, events.password, events.email);

    emit(state.copyWith(result: result));
  }
}
