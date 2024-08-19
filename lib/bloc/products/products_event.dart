part of 'products_bloc.dart';

abstract class ProductsEvent extends BaseBlocEvent {
  const ProductsEvent();
}

@freezed
class GetAllProducts extends ProductsEvent with _$GetAllProducts {
  const factory GetAllProducts() = _GetAllProducts;
}
