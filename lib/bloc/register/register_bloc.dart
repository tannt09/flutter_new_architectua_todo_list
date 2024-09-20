import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/register_api.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterUser>(_registerUser);
  }

  Future<void> _registerUser(
      RegisterUser events, Emitter<RegisterState> emit) async {
    await registerUser(events.username, events.password, events.email);
  }
}
