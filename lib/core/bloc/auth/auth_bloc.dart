import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/auth_api.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
    final AuthModel result = await loginUser(events.username, events.password);

    if (result.code == 200) {
      if (result.data != null &&
          result.data!.accessToken != null &&
          result.data!.refreshToken != null) {
        // await storage.write(key: 'access_token', value: result.data!.accessToken!);
        await saveToken(result.data!.accessToken!, result.data!.refreshToken!);
      }
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
