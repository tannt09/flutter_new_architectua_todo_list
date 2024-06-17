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
mixin _$AddTodoList {}

/// @nodoc
abstract class $AddTodoListCopyWith<$Res> {
  factory $AddTodoListCopyWith(
          AddTodoList value, $Res Function(AddTodoList) then) =
      _$AddTodoListCopyWithImpl<$Res, AddTodoList>;
}

/// @nodoc
class _$AddTodoListCopyWithImpl<$Res, $Val extends AddTodoList>
    implements $AddTodoListCopyWith<$Res> {
  _$AddTodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddTodoListImplCopyWith<$Res> {
  factory _$$AddTodoListImplCopyWith(
          _$AddTodoListImpl value, $Res Function(_$AddTodoListImpl) then) =
      __$$AddTodoListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTodoListImplCopyWithImpl<$Res>
    extends _$AddTodoListCopyWithImpl<$Res, _$AddTodoListImpl>
    implements _$$AddTodoListImplCopyWith<$Res> {
  __$$AddTodoListImplCopyWithImpl(
      _$AddTodoListImpl _value, $Res Function(_$AddTodoListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddTodoListImpl implements _AddTodoList {
  const _$AddTodoListImpl();

  @override
  String toString() {
    return 'AddTodoList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddTodoListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _AddTodoList implements AddTodoList {
  const factory _AddTodoList() = _$AddTodoListImpl;
}

/// @nodoc
mixin _$TodoListState {
  List<MyModel> get myList => throw _privateConstructorUsedError;

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
  $Res call({List<MyModel> myList});
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
    Object? myList = null,
  }) {
    return _then(_value.copyWith(
      myList: null == myList
          ? _value.myList
          : myList // ignore: cast_nullable_to_non_nullable
              as List<MyModel>,
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
  $Res call({List<MyModel> myList});
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
    Object? myList = null,
  }) {
    return _then(_$TodoListStateImpl(
      myList: null == myList
          ? _value._myList
          : myList // ignore: cast_nullable_to_non_nullable
              as List<MyModel>,
    ));
  }
}

/// @nodoc

class _$TodoListStateImpl implements _TodoListState {
  const _$TodoListStateImpl({final List<MyModel> myList = const <MyModel>[]})
      : _myList = myList;

  final List<MyModel> _myList;
  @override
  @JsonKey()
  List<MyModel> get myList {
    if (_myList is EqualUnmodifiableListView) return _myList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myList);
  }

  @override
  String toString() {
    return 'TodoListState(myList: $myList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListStateImpl &&
            const DeepCollectionEquality().equals(other._myList, _myList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_myList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListStateImplCopyWith<_$TodoListStateImpl> get copyWith =>
      __$$TodoListStateImplCopyWithImpl<_$TodoListStateImpl>(this, _$identity);
}

abstract class _TodoListState implements TodoListState {
  const factory _TodoListState({final List<MyModel> myList}) =
      _$TodoListStateImpl;

  @override
  List<MyModel> get myList;
  @override
  @JsonKey(ignore: true)
  _$$TodoListStateImplCopyWith<_$TodoListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
