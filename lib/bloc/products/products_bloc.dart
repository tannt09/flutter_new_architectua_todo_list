import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/products_api.dart';
import 'package:flutter_new_architectua/bloc/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/product_model.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends BaseBloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<GetAllProducts>(_getAllProducts);
    on<EditProduct>(_editProduct);
    on<AddProduct>(_addProduct);
    on<DeleteProduct>(_deleteProduct);

    _initializeState();
  }

  Future<void> _initializeState() async {
    add(const GetAllProducts());
  }

  Future<void> _getAllProducts(
      GetAllProducts event, Emitter<ProductsState> emit) async {
    final List<Product> newProducts = await fetchAllProduct();

    emitSafety(state.copyWith(products: newProducts));
  }

  Future<void> _editProduct(
      EditProduct event, Emitter<ProductsState> emit) async {
    await fetchEditProduct(event.product);
    add(const GetAllProducts());
  }

  Future<void> _addProduct(
      AddProduct event, Emitter<ProductsState> emit) async {
    await fetchAddNewProduct(event.product);
    add(const GetAllProducts());
  }

  Future<void> _deleteProduct(
      DeleteProduct event, Emitter<ProductsState> emit) async {
    await fetchDeleteProduct(event.id);
    add(const GetAllProducts());
  }
}
