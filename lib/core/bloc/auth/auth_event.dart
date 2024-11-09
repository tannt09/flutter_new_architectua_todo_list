part of 'auth_bloc.dart';

abstract class AuthEvent extends BaseBlocEvent {
  const AuthEvent();
}

@freezed
class LoginUser extends AuthEvent with _$LoginUser {
  const factory LoginUser(
      {required String username, required String password}) = _LoginUser;
}

@freezed
class RegisterUser extends AuthEvent with _$RegisterUser {
  const factory RegisterUser(
      {required String username,
      required String password,
      required String email}) = _RegisterUser;
}
