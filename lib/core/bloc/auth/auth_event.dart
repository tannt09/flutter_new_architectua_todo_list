part of 'auth_bloc.dart';

abstract class AuthEvent extends BaseBlocEvent {
  const AuthEvent();
}

@freezed
class LoginUserEvent extends AuthEvent with _$LoginUserEvent {
  const factory LoginUserEvent(
      {required String username, required String password}) = _LoginUserEvent;
}

@freezed
class RegisterUserEvent extends AuthEvent with _$RegisterUserEvent {
  const factory RegisterUserEvent(
      {required String username,
      required String password,
      required String email}) = _RegisterUserEvent;
}

@freezed
class GoogleLoginEvent extends AuthEvent with _$GoogleLoginEvent {
  const factory GoogleLoginEvent({required String idToken}) = _GoogleLoginEvent;
}
