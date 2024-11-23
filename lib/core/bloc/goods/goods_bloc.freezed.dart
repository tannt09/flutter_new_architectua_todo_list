// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goods_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllGoodsEvent {}

/// @nodoc
abstract class $GetAllGoodsEventCopyWith<$Res> {
  factory $GetAllGoodsEventCopyWith(
          GetAllGoodsEvent value, $Res Function(GetAllGoodsEvent) then) =
      _$GetAllGoodsEventCopyWithImpl<$Res, GetAllGoodsEvent>;
}

/// @nodoc
class _$GetAllGoodsEventCopyWithImpl<$Res, $Val extends GetAllGoodsEvent>
    implements $GetAllGoodsEventCopyWith<$Res> {
  _$GetAllGoodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllGoodsEventImplCopyWith<$Res> {
  factory _$$GetAllGoodsEventImplCopyWith(_$GetAllGoodsEventImpl value,
          $Res Function(_$GetAllGoodsEventImpl) then) =
      __$$GetAllGoodsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllGoodsEventImplCopyWithImpl<$Res>
    extends _$GetAllGoodsEventCopyWithImpl<$Res, _$GetAllGoodsEventImpl>
    implements _$$GetAllGoodsEventImplCopyWith<$Res> {
  __$$GetAllGoodsEventImplCopyWithImpl(_$GetAllGoodsEventImpl _value,
      $Res Function(_$GetAllGoodsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllGoodsEventImpl implements _GetAllGoodsEvent {
  const _$GetAllGoodsEventImpl();

  @override
  String toString() {
    return 'GetAllGoodsEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllGoodsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _GetAllGoodsEvent implements GetAllGoodsEvent {
  const factory _GetAllGoodsEvent() = _$GetAllGoodsEventImpl;
}

/// @nodoc
mixin _$ChangeFavoriteStateEvent {
  GoodsModel get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangeFavoriteStateEventCopyWith<ChangeFavoriteStateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeFavoriteStateEventCopyWith<$Res> {
  factory $ChangeFavoriteStateEventCopyWith(ChangeFavoriteStateEvent value,
          $Res Function(ChangeFavoriteStateEvent) then) =
      _$ChangeFavoriteStateEventCopyWithImpl<$Res, ChangeFavoriteStateEvent>;
  @useResult
  $Res call({GoodsModel item});
}

/// @nodoc
class _$ChangeFavoriteStateEventCopyWithImpl<$Res,
        $Val extends ChangeFavoriteStateEvent>
    implements $ChangeFavoriteStateEventCopyWith<$Res> {
  _$ChangeFavoriteStateEventCopyWithImpl(this._value, this._then);

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
              as GoodsModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeFavoriteStateEventImplCopyWith<$Res>
    implements $ChangeFavoriteStateEventCopyWith<$Res> {
  factory _$$ChangeFavoriteStateEventImplCopyWith(
          _$ChangeFavoriteStateEventImpl value,
          $Res Function(_$ChangeFavoriteStateEventImpl) then) =
      __$$ChangeFavoriteStateEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GoodsModel item});
}

/// @nodoc
class __$$ChangeFavoriteStateEventImplCopyWithImpl<$Res>
    extends _$ChangeFavoriteStateEventCopyWithImpl<$Res,
        _$ChangeFavoriteStateEventImpl>
    implements _$$ChangeFavoriteStateEventImplCopyWith<$Res> {
  __$$ChangeFavoriteStateEventImplCopyWithImpl(
      _$ChangeFavoriteStateEventImpl _value,
      $Res Function(_$ChangeFavoriteStateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$ChangeFavoriteStateEventImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as GoodsModel,
    ));
  }
}

/// @nodoc

class _$ChangeFavoriteStateEventImpl implements _ChangeFavoriteStateEvent {
  const _$ChangeFavoriteStateEventImpl({required this.item});

  @override
  final GoodsModel item;

  @override
  String toString() {
    return 'ChangeFavoriteStateEvent(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFavoriteStateEventImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFavoriteStateEventImplCopyWith<_$ChangeFavoriteStateEventImpl>
      get copyWith => __$$ChangeFavoriteStateEventImplCopyWithImpl<
          _$ChangeFavoriteStateEventImpl>(this, _$identity);
}

abstract class _ChangeFavoriteStateEvent implements ChangeFavoriteStateEvent {
  const factory _ChangeFavoriteStateEvent({required final GoodsModel item}) =
      _$ChangeFavoriteStateEventImpl;

  @override
  GoodsModel get item;
  @override
  @JsonKey(ignore: true)
  _$$ChangeFavoriteStateEventImplCopyWith<_$ChangeFavoriteStateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GoodsState {
  List<GoodsModel> get goods => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoodsStateCopyWith<GoodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodsStateCopyWith<$Res> {
  factory $GoodsStateCopyWith(
          GoodsState value, $Res Function(GoodsState) then) =
      _$GoodsStateCopyWithImpl<$Res, GoodsState>;
  @useResult
  $Res call({List<GoodsModel> goods});
}

/// @nodoc
class _$GoodsStateCopyWithImpl<$Res, $Val extends GoodsState>
    implements $GoodsStateCopyWith<$Res> {
  _$GoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goods = null,
  }) {
    return _then(_value.copyWith(
      goods: null == goods
          ? _value.goods
          : goods // ignore: cast_nullable_to_non_nullable
              as List<GoodsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoodsStateImplCopyWith<$Res>
    implements $GoodsStateCopyWith<$Res> {
  factory _$$GoodsStateImplCopyWith(
          _$GoodsStateImpl value, $Res Function(_$GoodsStateImpl) then) =
      __$$GoodsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GoodsModel> goods});
}

/// @nodoc
class __$$GoodsStateImplCopyWithImpl<$Res>
    extends _$GoodsStateCopyWithImpl<$Res, _$GoodsStateImpl>
    implements _$$GoodsStateImplCopyWith<$Res> {
  __$$GoodsStateImplCopyWithImpl(
      _$GoodsStateImpl _value, $Res Function(_$GoodsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goods = null,
  }) {
    return _then(_$GoodsStateImpl(
      goods: null == goods
          ? _value._goods
          : goods // ignore: cast_nullable_to_non_nullable
              as List<GoodsModel>,
    ));
  }
}

/// @nodoc

class _$GoodsStateImpl implements _GoodsState {
  const _$GoodsStateImpl({final List<GoodsModel> goods = const []})
      : _goods = goods;

  final List<GoodsModel> _goods;
  @override
  @JsonKey()
  List<GoodsModel> get goods {
    if (_goods is EqualUnmodifiableListView) return _goods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goods);
  }

  @override
  String toString() {
    return 'GoodsState(goods: $goods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoodsStateImpl &&
            const DeepCollectionEquality().equals(other._goods, _goods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoodsStateImplCopyWith<_$GoodsStateImpl> get copyWith =>
      __$$GoodsStateImplCopyWithImpl<_$GoodsStateImpl>(this, _$identity);
}

abstract class _GoodsState implements GoodsState {
  const factory _GoodsState({final List<GoodsModel> goods}) = _$GoodsStateImpl;

  @override
  List<GoodsModel> get goods;
  @override
  @JsonKey(ignore: true)
  _$$GoodsStateImplCopyWith<_$GoodsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
