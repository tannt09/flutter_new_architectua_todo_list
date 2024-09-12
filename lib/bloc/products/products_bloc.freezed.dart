// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllProducts {}

/// @nodoc
abstract class $GetAllProductsCopyWith<$Res> {
  factory $GetAllProductsCopyWith(
          GetAllProducts value, $Res Function(GetAllProducts) then) =
      _$GetAllProductsCopyWithImpl<$Res, GetAllProducts>;
}

/// @nodoc
class _$GetAllProductsCopyWithImpl<$Res, $Val extends GetAllProducts>
    implements $GetAllProductsCopyWith<$Res> {
  _$GetAllProductsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllProductsImplCopyWith<$Res> {
  factory _$$GetAllProductsImplCopyWith(_$GetAllProductsImpl value,
          $Res Function(_$GetAllProductsImpl) then) =
      __$$GetAllProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllProductsImplCopyWithImpl<$Res>
    extends _$GetAllProductsCopyWithImpl<$Res, _$GetAllProductsImpl>
    implements _$$GetAllProductsImplCopyWith<$Res> {
  __$$GetAllProductsImplCopyWithImpl(
      _$GetAllProductsImpl _value, $Res Function(_$GetAllProductsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllProductsImpl implements _GetAllProducts {
  const _$GetAllProductsImpl();

  @override
  String toString() {
    return 'GetAllProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _GetAllProducts implements GetAllProducts {
  const factory _GetAllProducts() = _$GetAllProductsImpl;
}

/// @nodoc
mixin _$EditProduct {
  Product get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProductCopyWith<EditProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProductCopyWith<$Res> {
  factory $EditProductCopyWith(
          EditProduct value, $Res Function(EditProduct) then) =
      _$EditProductCopyWithImpl<$Res, EditProduct>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class _$EditProductCopyWithImpl<$Res, $Val extends EditProduct>
    implements $EditProductCopyWith<$Res> {
  _$EditProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProductImplCopyWith<$Res>
    implements $EditProductCopyWith<$Res> {
  factory _$$EditProductImplCopyWith(
          _$EditProductImpl value, $Res Function(_$EditProductImpl) then) =
      __$$EditProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$EditProductImplCopyWithImpl<$Res>
    extends _$EditProductCopyWithImpl<$Res, _$EditProductImpl>
    implements _$$EditProductImplCopyWith<$Res> {
  __$$EditProductImplCopyWithImpl(
      _$EditProductImpl _value, $Res Function(_$EditProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$EditProductImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$EditProductImpl implements _EditProduct {
  const _$EditProductImpl({required this.product});

  @override
  final Product product;

  @override
  String toString() {
    return 'EditProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProductImplCopyWith<_$EditProductImpl> get copyWith =>
      __$$EditProductImplCopyWithImpl<_$EditProductImpl>(this, _$identity);
}

abstract class _EditProduct implements EditProduct {
  const factory _EditProduct({required final Product product}) =
      _$EditProductImpl;

  @override
  Product get product;
  @override
  @JsonKey(ignore: true)
  _$$EditProductImplCopyWith<_$EditProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddProduct {
  Product get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductCopyWith<AddProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductCopyWith<$Res> {
  factory $AddProductCopyWith(
          AddProduct value, $Res Function(AddProduct) then) =
      _$AddProductCopyWithImpl<$Res, AddProduct>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class _$AddProductCopyWithImpl<$Res, $Val extends AddProduct>
    implements $AddProductCopyWith<$Res> {
  _$AddProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res>
    implements $AddProductCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
          _$AddProductImpl value, $Res Function(_$AddProductImpl) then) =
      __$$AddProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$AddProductCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
      _$AddProductImpl _value, $Res Function(_$AddProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$AddProductImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl({required this.product});

  @override
  final Product product;

  @override
  String toString() {
    return 'AddProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);
}

abstract class _AddProduct implements AddProduct {
  const factory _AddProduct({required final Product product}) =
      _$AddProductImpl;

  @override
  Product get product;
  @override
  @JsonKey(ignore: true)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeleteProduct {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteProductCopyWith<DeleteProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteProductCopyWith<$Res> {
  factory $DeleteProductCopyWith(
          DeleteProduct value, $Res Function(DeleteProduct) then) =
      _$DeleteProductCopyWithImpl<$Res, DeleteProduct>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DeleteProductCopyWithImpl<$Res, $Val extends DeleteProduct>
    implements $DeleteProductCopyWith<$Res> {
  _$DeleteProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteProductImplCopyWith<$Res>
    implements $DeleteProductCopyWith<$Res> {
  factory _$$DeleteProductImplCopyWith(
          _$DeleteProductImpl value, $Res Function(_$DeleteProductImpl) then) =
      __$$DeleteProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteProductImplCopyWithImpl<$Res>
    extends _$DeleteProductCopyWithImpl<$Res, _$DeleteProductImpl>
    implements _$$DeleteProductImplCopyWith<$Res> {
  __$$DeleteProductImplCopyWithImpl(
      _$DeleteProductImpl _value, $Res Function(_$DeleteProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteProductImpl implements _DeleteProduct {
  const _$DeleteProductImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'DeleteProduct(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProductImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      __$$DeleteProductImplCopyWithImpl<_$DeleteProductImpl>(this, _$identity);
}

abstract class _DeleteProduct implements DeleteProduct {
  const factory _DeleteProduct({required final String id}) =
      _$DeleteProductImpl;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductsState {
  List<Product> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

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
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductsStateImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl implements _ProductsState {
  const _$ProductsStateImpl({final List<Product> products = const []})
      : _products = products;

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductsState(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState({final List<Product> products}) =
      _$ProductsStateImpl;

  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
