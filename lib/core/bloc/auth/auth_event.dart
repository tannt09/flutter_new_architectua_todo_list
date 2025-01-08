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
class VerifyIdTokenEvent extends AuthEvent with _$VerifyIdTokenEvent {
  const factory VerifyIdTokenEvent({required String idToken}) = _VerifyIdTokenEvent;
}
