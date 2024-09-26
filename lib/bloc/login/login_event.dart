part of 'login_bloc.dart';

abstract class LoginEvent extends BaseBlocEvent {
  const LoginEvent();
}

@freezed
class LoginUser extends LoginEvent with _$LoginUser {
  const factory LoginUser(
      {required String username, required String password}) = _LoginUser;
}
