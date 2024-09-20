part of 'register_bloc.dart';

abstract class RegisterEvent extends BaseBlocEvent {
  const RegisterEvent();
}

@freezed
class RegisterUser extends RegisterEvent with _$RegisterUser {
  const factory RegisterUser(
      {required String username,
      required String password,
      required String email}) = _RegisterUser;
}
