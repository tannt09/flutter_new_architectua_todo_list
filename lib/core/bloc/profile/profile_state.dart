part of 'profile_bloc.dart';

@freezed
class ProfileState extends BaseBlocState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileModel(
      id: 0,
      userId: '',
      fullName: '',
      email: '',
      phoneNumber: '000-000-0000',
      username: '',
      gender: 0,
      dateOfBirth: '2000-01-01',
    ))
    ProfileModel profile,
    @Default("") String avatarPath,
  }) = _ProfileState;
}
