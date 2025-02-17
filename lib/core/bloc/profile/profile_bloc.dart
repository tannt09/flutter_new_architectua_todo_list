import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/profile_api.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<GetUserProfileEvent>(_getUserProfile);
    on<EditUserProfileEvent>(_editUserProfile);
    on<SaveAvatarPathEvent>(_saveAvatarPath);
    on<DeleteAvatarPathEvent>(_deleteAvatarPath);
    on<UploadAvatarEvent>(_uploadAvatar);
  }

  Future<void> _getUserProfile(
      GetUserProfileEvent event, Emitter<ProfileState> emit) async {
    final ProfileModel result = await fetchUserProfile(event.userId);
    emitSafety(state.copyWith(profile: result));
  }

  Future<void> _editUserProfile(
      EditUserProfileEvent event, Emitter<ProfileState> emit) async {
    await editUserProfile(event.newProfile);
    if (event.newProfile.userId != null) {
      add(GetUserProfileEvent(userId: event.newProfile.userId!));
    }
  }

  Future<void> _saveAvatarPath(
      SaveAvatarPathEvent event, Emitter<ProfileState> emit) async {
    emitSafety(state.copyWith(avatarPath: event.path));
  }

  Future<void> _uploadAvatar(
      UploadAvatarEvent event, Emitter<ProfileState> emit) async {
    final UploadAvatarResponseModel result = await uploadAvatar(event.path);
    if (event.userId != null && result.imageUrl != null) {
      await editAvatarOfUserProfile(result.imageUrl!, event.userId!);
      add(GetUserProfileEvent(userId: event.userId!));
    }
  }

  Future<void> _deleteAvatarPath(
      DeleteAvatarPathEvent event, Emitter<ProfileState> emit) async {
    emitSafety(state.copyWith(avatarPath: ''));
  }
}
