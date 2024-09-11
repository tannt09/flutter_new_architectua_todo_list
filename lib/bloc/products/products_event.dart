part of 'products_bloc.dart';

abstract class ProductsEvent extends BaseBlocEvent {
  const ProductsEvent();
}

@freezed
class GetAllProducts extends ProductsEvent with _$GetAllProducts {
  const factory GetAllProducts() = _GetAllProducts;
}

@freezed
class EditProduct extends ProductsEvent with _$EditProduct {
  const factory EditProduct({required Product product}) = _EditProduct;
}

@freezed
class AddProduct extends ProductsEvent with _$AddProduct {
  const factory AddProduct({required Product product}) = _AddProduct;
}
