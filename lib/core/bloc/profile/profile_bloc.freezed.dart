// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetUserProfileEvent {
  String get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetUserProfileEventCopyWith<GetUserProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserProfileEventCopyWith<$Res> {
  factory $GetUserProfileEventCopyWith(
          GetUserProfileEvent value, $Res Function(GetUserProfileEvent) then) =
      _$GetUserProfileEventCopyWithImpl<$Res, GetUserProfileEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$GetUserProfileEventCopyWithImpl<$Res, $Val extends GetUserProfileEvent>
    implements $GetUserProfileEventCopyWith<$Res> {
  _$GetUserProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserProfileEventImplCopyWith<$Res>
    implements $GetUserProfileEventCopyWith<$Res> {
  factory _$$GetUserProfileEventImplCopyWith(_$GetUserProfileEventImpl value,
          $Res Function(_$GetUserProfileEventImpl) then) =
      __$$GetUserProfileEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetUserProfileEventImplCopyWithImpl<$Res>
    extends _$GetUserProfileEventCopyWithImpl<$Res, _$GetUserProfileEventImpl>
    implements _$$GetUserProfileEventImplCopyWith<$Res> {
  __$$GetUserProfileEventImplCopyWithImpl(_$GetUserProfileEventImpl _value,
      $Res Function(_$GetUserProfileEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetUserProfileEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserProfileEventImpl implements _GetUserProfileEvent {
  const _$GetUserProfileEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'GetUserProfileEvent(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProfileEventImplCopyWith<_$GetUserProfileEventImpl> get copyWith =>
      __$$GetUserProfileEventImplCopyWithImpl<_$GetUserProfileEventImpl>(
          this, _$identity);
}

abstract class _GetUserProfileEvent implements GetUserProfileEvent {
  const factory _GetUserProfileEvent({required final String userId}) =
      _$GetUserProfileEventImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$GetUserProfileEventImplCopyWith<_$GetUserProfileEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditUserProfileEvent {
  ProfileModel get newProfile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditUserProfileEventCopyWith<EditUserProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditUserProfileEventCopyWith<$Res> {
  factory $EditUserProfileEventCopyWith(EditUserProfileEvent value,
          $Res Function(EditUserProfileEvent) then) =
      _$EditUserProfileEventCopyWithImpl<$Res, EditUserProfileEvent>;
  @useResult
  $Res call({ProfileModel newProfile});
}

/// @nodoc
class _$EditUserProfileEventCopyWithImpl<$Res,
        $Val extends EditUserProfileEvent>
    implements $EditUserProfileEventCopyWith<$Res> {
  _$EditUserProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newProfile = null,
  }) {
    return _then(_value.copyWith(
      newProfile: null == newProfile
          ? _value.newProfile
          : newProfile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditUserProfileEventImplCopyWith<$Res>
    implements $EditUserProfileEventCopyWith<$Res> {
  factory _$$EditUserProfileEventImplCopyWith(_$EditUserProfileEventImpl value,
          $Res Function(_$EditUserProfileEventImpl) then) =
      __$$EditUserProfileEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileModel newProfile});
}

/// @nodoc
class __$$EditUserProfileEventImplCopyWithImpl<$Res>
    extends _$EditUserProfileEventCopyWithImpl<$Res, _$EditUserProfileEventImpl>
    implements _$$EditUserProfileEventImplCopyWith<$Res> {
  __$$EditUserProfileEventImplCopyWithImpl(_$EditUserProfileEventImpl _value,
      $Res Function(_$EditUserProfileEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newProfile = null,
  }) {
    return _then(_$EditUserProfileEventImpl(
      newProfile: null == newProfile
          ? _value.newProfile
          : newProfile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$EditUserProfileEventImpl implements _EditUserProfileEvent {
  const _$EditUserProfileEventImpl({required this.newProfile});

  @override
  final ProfileModel newProfile;

  @override
  String toString() {
    return 'EditUserProfileEvent(newProfile: $newProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditUserProfileEventImpl &&
            (identical(other.newProfile, newProfile) ||
                other.newProfile == newProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditUserProfileEventImplCopyWith<_$EditUserProfileEventImpl>
      get copyWith =>
          __$$EditUserProfileEventImplCopyWithImpl<_$EditUserProfileEventImpl>(
              this, _$identity);
}

abstract class _EditUserProfileEvent implements EditUserProfileEvent {
  const factory _EditUserProfileEvent(
      {required final ProfileModel newProfile}) = _$EditUserProfileEventImpl;

  @override
  ProfileModel get newProfile;
  @override
  @JsonKey(ignore: true)
  _$$EditUserProfileEventImplCopyWith<_$EditUserProfileEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  ProfileModel get profile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({ProfileModel profile});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileModel profile});
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ProfileStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.profile = const ProfileModel(
          id: 0,
          userId: '',
          fullName: '',
          email: '',
          phoneNumber: '000-000-0000',
          username: '',
          gender: 0,
          dateOfBirth: '2000-01-01')});

  @override
  @JsonKey()
  final ProfileModel profile;

  @override
  String toString() {
    return 'ProfileState(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState({final ProfileModel profile}) =
      _$ProfileStateImpl;

  @override
  ProfileModel get profile;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
