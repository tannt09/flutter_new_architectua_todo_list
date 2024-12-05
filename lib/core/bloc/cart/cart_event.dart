part of 'cart_bloc.dart';

abstract class CartEvent extends BaseBlocEvent {
  const CartEvent();
}

@freezed
class GetCartEvent extends CartEvent with _$GetCartEvent {
  const factory GetCartEvent() = _GetCartEvent;
}

@freezed
class AddToCartEvent extends CartEvent with _$AddToCartEvent {
  const factory AddToCartEvent({required ItemCartModel item}) = _AddToCartEvent;
}

@freezed
class ChangeQuantityEvent extends CartEvent with _$ChangeQuantityEvent {
  const factory ChangeQuantityEvent({required int newQuantity, required int id}) =
      _ChangeQuantityEvent;
}

@freezed
class DeleteItemEvent extends CartEvent with _$DeleteItemEvent {
  const factory DeleteItemEvent({required int id}) =
      _DeleteItemEvent;
}
