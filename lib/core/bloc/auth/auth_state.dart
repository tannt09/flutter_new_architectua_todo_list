part of 'auth_bloc.dart';

@freezed
class AuthState extends BaseBlocState with _$AuthState {
  // Change initialResult to a non-const variable
  const factory AuthState(
      {@Default(AuthModel(code: 0, message: "", data: null)) AuthModel result,
      @Default(false) bool isLoading}) = _AuthState;
}
