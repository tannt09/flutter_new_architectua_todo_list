// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateTodoList {}

/// @nodoc
abstract class $UpdateTodoListCopyWith<$Res> {
  factory $UpdateTodoListCopyWith(
          UpdateTodoList value, $Res Function(UpdateTodoList) then) =
      _$UpdateTodoListCopyWithImpl<$Res, UpdateTodoList>;
}

/// @nodoc
class _$UpdateTodoListCopyWithImpl<$Res, $Val extends UpdateTodoList>
    implements $UpdateTodoListCopyWith<$Res> {
  _$UpdateTodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateTodoListImplCopyWith<$Res> {
  factory _$$UpdateTodoListImplCopyWith(_$UpdateTodoListImpl value,
          $Res Function(_$UpdateTodoListImpl) then) =
      __$$UpdateTodoListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateTodoListImplCopyWithImpl<$Res>
    extends _$UpdateTodoListCopyWithImpl<$Res, _$UpdateTodoListImpl>
    implements _$$UpdateTodoListImplCopyWith<$Res> {
  __$$UpdateTodoListImplCopyWithImpl(
      _$UpdateTodoListImpl _value, $Res Function(_$UpdateTodoListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateTodoListImpl implements _UpdateTodoList {
  const _$UpdateTodoListImpl();

  @override
  String toString() {
    return 'UpdateTodoList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateTodoListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _UpdateTodoList implements UpdateTodoList {
  const factory _UpdateTodoList() = _$UpdateTodoListImpl;
}

/// @nodoc
mixin _$AddTodoList {
  User get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTodoListCopyWith<AddTodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoListCopyWith<$Res> {
  factory $AddTodoListCopyWith(
          AddTodoList value, $Res Function(AddTodoList) then) =
      _$AddTodoListCopyWithImpl<$Res, AddTodoList>;
  @useResult
  $Res call({User item});
}

/// @nodoc
class _$AddTodoListCopyWithImpl<$Res, $Val extends AddTodoList>
    implements $AddTodoListCopyWith<$Res> {
  _$AddTodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddTodoListImplCopyWith<$Res>
    implements $AddTodoListCopyWith<$Res> {
  factory _$$AddTodoListImplCopyWith(
          _$AddTodoListImpl value, $Res Function(_$AddTodoListImpl) then) =
      __$$AddTodoListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User item});
}

/// @nodoc
class __$$AddTodoListImplCopyWithImpl<$Res>
    extends _$AddTodoListCopyWithImpl<$Res, _$AddTodoListImpl>
    implements _$$AddTodoListImplCopyWith<$Res> {
  __$$AddTodoListImplCopyWithImpl(
      _$AddTodoListImpl _value, $Res Function(_$AddTodoListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddTodoListImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AddTodoListImpl implements _AddTodoList {
  const _$AddTodoListImpl({required this.item});

  @override
  final User item;

  @override
  String toString() {
    return 'AddTodoList(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoListImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoListImplCopyWith<_$AddTodoListImpl> get copyWith =>
      __$$AddTodoListImplCopyWithImpl<_$AddTodoListImpl>(this, _$identity);
}

abstract class _AddTodoList implements AddTodoList {
  const factory _AddTodoList({required final User item}) = _$AddTodoListImpl;

  @override
  User get item;
  @override
  @JsonKey(ignore: true)
  _$$AddTodoListImplCopyWith<_$AddTodoListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeleteTodoList {
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteTodoListCopyWith<DeleteTodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteTodoListCopyWith<$Res> {
  factory $DeleteTodoListCopyWith(
          DeleteTodoList value, $Res Function(DeleteTodoList) then) =
      _$DeleteTodoListCopyWithImpl<$Res, DeleteTodoList>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$DeleteTodoListCopyWithImpl<$Res, $Val extends DeleteTodoList>
    implements $DeleteTodoListCopyWith<$Res> {
  _$DeleteTodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteTodoListImplCopyWith<$Res>
    implements $DeleteTodoListCopyWith<$Res> {
  factory _$$DeleteTodoListImplCopyWith(_$DeleteTodoListImpl value,
          $Res Function(_$DeleteTodoListImpl) then) =
      __$$DeleteTodoListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeleteTodoListImplCopyWithImpl<$Res>
    extends _$DeleteTodoListCopyWithImpl<$Res, _$DeleteTodoListImpl>
    implements _$$DeleteTodoListImplCopyWith<$Res> {
  __$$DeleteTodoListImplCopyWithImpl(
      _$DeleteTodoListImpl _value, $Res Function(_$DeleteTodoListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeleteTodoListImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteTodoListImpl implements _DeleteTodoList {
  const _$DeleteTodoListImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'DeleteTodoList(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTodoListImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTodoListImplCopyWith<_$DeleteTodoListImpl> get copyWith =>
      __$$DeleteTodoListImplCopyWithImpl<_$DeleteTodoListImpl>(
          this, _$identity);
}

abstract class _DeleteTodoList implements DeleteTodoList {
  const factory _DeleteTodoList({required final int index}) =
      _$DeleteTodoListImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$DeleteTodoListImplCopyWith<_$DeleteTodoListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditTodoList {
  User get item => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTodoListCopyWith<EditTodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTodoListCopyWith<$Res> {
  factory $EditTodoListCopyWith(
          EditTodoList value, $Res Function(EditTodoList) then) =
      _$EditTodoListCopyWithImpl<$Res, EditTodoList>;
  @useResult
  $Res call({User item, int index});
}

/// @nodoc
class _$EditTodoListCopyWithImpl<$Res, $Val extends EditTodoList>
    implements $EditTodoListCopyWith<$Res> {
  _$EditTodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as User,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditTodoListImplCopyWith<$Res>
    implements $EditTodoListCopyWith<$Res> {
  factory _$$EditTodoListImplCopyWith(
          _$EditTodoListImpl value, $Res Function(_$EditTodoListImpl) then) =
      __$$EditTodoListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User item, int index});
}

/// @nodoc
class __$$EditTodoListImplCopyWithImpl<$Res>
    extends _$EditTodoListCopyWithImpl<$Res, _$EditTodoListImpl>
    implements _$$EditTodoListImplCopyWith<$Res> {
  __$$EditTodoListImplCopyWithImpl(
      _$EditTodoListImpl _value, $Res Function(_$EditTodoListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? index = null,
  }) {
    return _then(_$EditTodoListImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as User,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EditTodoListImpl implements _EditTodoList {
  const _$EditTodoListImpl({required this.item, required this.index});

  @override
  final User item;
  @override
  final int index;

  @override
  String toString() {
    return 'EditTodoList(item: $item, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTodoListImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditTodoListImplCopyWith<_$EditTodoListImpl> get copyWith =>
      __$$EditTodoListImplCopyWithImpl<_$EditTodoListImpl>(this, _$identity);
}

abstract class _EditTodoList implements EditTodoList {
  const factory _EditTodoList(
      {required final User item,
      required final int index}) = _$EditTodoListImpl;

  @override
  User get item;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$EditTodoListImplCopyWith<_$EditTodoListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TodoListState {
  List<User> get userList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListStateCopyWith<TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res, TodoListState>;
  @useResult
  $Res call({List<User> userList});
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res, $Val extends TodoListState>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userList = null,
  }) {
    return _then(_value.copyWith(
      userList: null == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoListStateImplCopyWith<$Res>
    implements $TodoListStateCopyWith<$Res> {
  factory _$$TodoListStateImplCopyWith(
          _$TodoListStateImpl value, $Res Function(_$TodoListStateImpl) then) =
      __$$TodoListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> userList});
}

/// @nodoc
class __$$TodoListStateImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$TodoListStateImpl>
    implements _$$TodoListStateImplCopyWith<$Res> {
  __$$TodoListStateImplCopyWithImpl(
      _$TodoListStateImpl _value, $Res Function(_$TodoListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userList = null,
  }) {
    return _then(_$TodoListStateImpl(
      userList: null == userList
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$TodoListStateImpl implements _TodoListState {
  const _$TodoListStateImpl({final List<User> userList = const <User>[]})
      : _userList = userList;

  final List<User> _userList;
  @override
  @JsonKey()
  List<User> get userList {
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userList);
  }

  @override
  String toString() {
    return 'TodoListState(userList: $userList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListStateImpl &&
            const DeepCollectionEquality().equals(other._userList, _userList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_userList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListStateImplCopyWith<_$TodoListStateImpl> get copyWith =>
      __$$TodoListStateImplCopyWithImpl<_$TodoListStateImpl>(this, _$identity);
}

abstract class _TodoListState implements TodoListState {
  const factory _TodoListState({final List<User> userList}) =
      _$TodoListStateImpl;

  @override
  List<User> get userList;
  @override
  @JsonKey(ignore: true)
  _$$TodoListStateImplCopyWith<_$TodoListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
