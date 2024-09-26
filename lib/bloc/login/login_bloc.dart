import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/auth_api.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/login_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginUser>(_loginUser);
  }

  Future<void> _loginUser(LoginUser events, Emitter<LoginState> emit) async {
    final LoginModel result = await loginUser(events.username, events.password);
    emit(state.copyWith(result: result));
  }
}
