part of 'cart_bloc.dart';

abstract class CartEvent extends BaseBlocEvent {
  const CartEvent();
}

@freezed
class AddToCartEvent extends CartEvent with _$AddToCartEvent {
  const factory AddToCartEvent({required ItemCartModel item}) = _AddToCartEvent;
}
