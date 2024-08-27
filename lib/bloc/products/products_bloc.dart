import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/products_api.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends BaseBloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<GetAllProducts>(_getAllProducts);

    _initializeState();
  }

  Future<void> _initializeState() async {
    add(const GetAllProducts());
  }

  Future<void> _getAllProducts(
      GetAllProducts event, Emitter<ProductsState> emit) async {
    final List<Product> newProducts = await fetchAllProduct();
    emit(state.copyWith(products: newProducts));
  }
}