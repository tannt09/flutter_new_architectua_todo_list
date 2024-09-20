part of 'register_bloc.dart';

@freezed
class RegisterState extends BaseBlocState with _$RegisterState {
  const factory RegisterState({
    @Default("") String result,
  }) = _RegisterState;
}
