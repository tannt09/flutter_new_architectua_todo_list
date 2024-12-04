import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/item_cart_model.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sql.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<GetCartEvent>(_getCart);
    on<AddToCartEvent>(_addToCart);
  }

  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  Future<void> _getCart(GetCartEvent event, Emitter<CartState> emit) async {
    final parsed = await database.query('goods');
    final List<ItemCartModel> newCart = parsed
        .map<ItemCartModel>((json) => ItemCartModel.fromJson(json))
        .toList();

    emitSafety(state.copyWith(cart: newCart));
  }

  Future<void> _addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    await database.insert('goods', event.item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    add(const GetCartEvent());

    navigator.push(const CartRoute());
  }
}
