import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/widget/cart/bill_widget.dart';
import 'package:flutter_new_architectua/widget/cart/cart_item_widget.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  @override
  void initState() {
    super.initState();
    blocCart.add(const GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
          leftIcon: 'assets/icons/left_arrow_icon.svg',
          title: 'Cart',
          rightIcon: 'assets/icons/ellipsis_icon.svg'),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          double calculateTotalCost() {
            double subtotal = 0;
            for (var item in state.cart) {
              subtotal = subtotal + item.price * item.quantity;
            }
            return subtotal;
          }

          final totalPrice = calculateTotalCost();

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: ListView.builder(
                      itemCount: state.cart.length,
                      itemBuilder: (context, index) {
                        final item = state.cart[index];
                        return CartItemWidget(item: item);
                      }),
                ),
                BillWidget(
                    totalPrice: totalPrice, cartLength: state.cart.length),
                GestureDetector(
                  onTap: () {
                    navigator.push(const CheckoutRoute());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Check Out',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
