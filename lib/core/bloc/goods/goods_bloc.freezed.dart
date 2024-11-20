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
mixin _$GetAllGoods {}

/// @nodoc
abstract class $GetAllGoodsCopyWith<$Res> {
  factory $GetAllGoodsCopyWith(
          GetAllGoods value, $Res Function(GetAllGoods) then) =
      _$GetAllGoodsCopyWithImpl<$Res, GetAllGoods>;
}

/// @nodoc
class _$GetAllGoodsCopyWithImpl<$Res, $Val extends GetAllGoods>
    implements $GetAllGoodsCopyWith<$Res> {
  _$GetAllGoodsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllGoodsImplCopyWith<$Res> {
  factory _$$GetAllGoodsImplCopyWith(
          _$GetAllGoodsImpl value, $Res Function(_$GetAllGoodsImpl) then) =
      __$$GetAllGoodsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllGoodsImplCopyWithImpl<$Res>
    extends _$GetAllGoodsCopyWithImpl<$Res, _$GetAllGoodsImpl>
    implements _$$GetAllGoodsImplCopyWith<$Res> {
  __$$GetAllGoodsImplCopyWithImpl(
      _$GetAllGoodsImpl _value, $Res Function(_$GetAllGoodsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllGoodsImpl implements _GetAllGoods {
  const _$GetAllGoodsImpl();

  @override
  String toString() {
    return 'GetAllGoods()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllGoodsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _GetAllGoods implements GetAllGoods {
  const factory _GetAllGoods() = _$GetAllGoodsImpl;
}

/// @nodoc
mixin _$GoodsState {
  List<GoodsModel> get products => throw _privateConstructorUsedError;

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
  $Res call({List<GoodsModel> products});
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
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
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
  $Res call({List<GoodsModel> products});
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
    Object? products = null,
  }) {
    return _then(_$GoodsStateImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<GoodsModel>,
    ));
  }
}

/// @nodoc

class _$GoodsStateImpl implements _GoodsState {
  const _$GoodsStateImpl({final List<GoodsModel> products = const []})
      : _products = products;

  final List<GoodsModel> _products;
  @override
  @JsonKey()
  List<GoodsModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'GoodsState(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoodsStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoodsStateImplCopyWith<_$GoodsStateImpl> get copyWith =>
      __$$GoodsStateImplCopyWithImpl<_$GoodsStateImpl>(this, _$identity);
}

abstract class _GoodsState implements GoodsState {
  const factory _GoodsState({final List<GoodsModel> products}) =
      _$GoodsStateImpl;

  @override
  List<GoodsModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$GoodsStateImplCopyWith<_$GoodsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
