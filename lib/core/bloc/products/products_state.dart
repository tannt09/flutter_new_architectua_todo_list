part of 'products_bloc.dart';

@freezed
class ProductsState extends BaseBlocState with _$ProductsState {
  const factory ProductsState({
    @Default([]) List<Product> products,
  }) = _ProductsState;
}
