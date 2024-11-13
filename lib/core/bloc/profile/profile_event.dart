part of 'profile_bloc.dart';

abstract class ProfileEvent extends BaseBlocEvent {
  const ProfileEvent();
}

@freezed
class GetUserProfileEvent extends ProfileEvent with _$GetUserProfileEvent {
  const factory GetUserProfileEvent({required String userId}) = _GetUserProfileEvent;
}