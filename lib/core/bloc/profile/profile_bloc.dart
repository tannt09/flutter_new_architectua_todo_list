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
}
