part of 'cart_bloc.dart';

@freezed
class CartState extends BaseBlocState with _$CartState {
  const factory CartState({
    @Default([]) List<ItemCartModel> cart,
  }) = _CartState;
}
