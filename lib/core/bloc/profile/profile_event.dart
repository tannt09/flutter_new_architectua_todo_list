part of 'profile_bloc.dart';

abstract class ProfileEvent extends BaseBlocEvent {
  const ProfileEvent();
}

@freezed
class GetUserProfileEvent extends ProfileEvent with _$GetUserProfileEvent {
  const factory GetUserProfileEvent({required String userId}) =
      _GetUserProfileEvent;
}

@freezed
class EditUserProfileEvent extends ProfileEvent with _$EditUserProfileEvent {
  const factory EditUserProfileEvent({required ProfileModel newProfile}) =
      _EditUserProfileEvent;
}

@freezed
class SaveAvatarPathEvent extends ProfileEvent with _$SaveAvatarPathEvent {
  const factory SaveAvatarPathEvent({required String path}) =
      _SaveAvatarPathEvent;
}

@freezed
class UploadAvatarEvent extends ProfileEvent with _$UploadAvatarEvent {
  const factory UploadAvatarEvent({required String path}) = _UploadAvatarEvent;
}
