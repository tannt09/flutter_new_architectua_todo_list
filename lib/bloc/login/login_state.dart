part of 'login_bloc.dart';

@freezed
class LoginState extends BaseBlocState with _$LoginState {
  // Change initialResult to a non-const variable
  const factory LoginState(
      {@Default(LoginModel(code: 0, message: "", data: null, error: ""))
      LoginModel result}) = _LoginState;
}
