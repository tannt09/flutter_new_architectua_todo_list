// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddToCartEvent {
  ItemCartModel get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToCartEventCopyWith<AddToCartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartEventCopyWith<$Res> {
  factory $AddToCartEventCopyWith(
          AddToCartEvent value, $Res Function(AddToCartEvent) then) =
      _$AddToCartEventCopyWithImpl<$Res, AddToCartEvent>;
  @useResult
  $Res call({ItemCartModel item});
}

/// @nodoc
class _$AddToCartEventCopyWithImpl<$Res, $Val extends AddToCartEvent>
    implements $AddToCartEventCopyWith<$Res> {
  _$AddToCartEventCopyWithImpl(this._value, this._then);

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
              as ItemCartModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddToCartEventImplCopyWith<$Res>
    implements $AddToCartEventCopyWith<$Res> {
  factory _$$AddToCartEventImplCopyWith(_$AddToCartEventImpl value,
          $Res Function(_$AddToCartEventImpl) then) =
      __$$AddToCartEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ItemCartModel item});
}

/// @nodoc
class __$$AddToCartEventImplCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res, _$AddToCartEventImpl>
    implements _$$AddToCartEventImplCopyWith<$Res> {
  __$$AddToCartEventImplCopyWithImpl(
      _$AddToCartEventImpl _value, $Res Function(_$AddToCartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddToCartEventImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemCartModel,
    ));
  }
}

/// @nodoc

class _$AddToCartEventImpl implements _AddToCartEvent {
  const _$AddToCartEventImpl({required this.item});

  @override
  final ItemCartModel item;

  @override
  String toString() {
    return 'AddToCartEvent(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartEventImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartEventImplCopyWith<_$AddToCartEventImpl> get copyWith =>
      __$$AddToCartEventImplCopyWithImpl<_$AddToCartEventImpl>(
          this, _$identity);
}

abstract class _AddToCartEvent implements AddToCartEvent {
  const factory _AddToCartEvent({required final ItemCartModel item}) =
      _$AddToCartEventImpl;

  @override
  ItemCartModel get item;
  @override
  @JsonKey(ignore: true)
  _$$AddToCartEventImplCopyWith<_$AddToCartEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<ItemCartModel> get cart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call({List<ItemCartModel> cart});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = null,
  }) {
    return _then(_value.copyWith(
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<ItemCartModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ItemCartModel> cart});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = null,
  }) {
    return _then(_$CartStateImpl(
      cart: null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<ItemCartModel>,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl({final List<ItemCartModel> cart = const []})
      : _cart = cart;

  final List<ItemCartModel> _cart;
  @override
  @JsonKey()
  List<ItemCartModel> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

  @override
  String toString() {
    return 'CartState(cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality().equals(other._cart, _cart));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cart));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState({final List<ItemCartModel> cart}) = _$CartStateImpl;

  @override
  List<ItemCartModel> get cart;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
