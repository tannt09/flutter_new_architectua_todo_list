import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/widget/cart/cart_item_widget.dart';
import 'package:flutter_new_architectua/widget/cart/custom_row_widget.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    blocCart.add(const GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: AppColors.main2,
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/left_arrow_icon.svg'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        leadingWidth: 60,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 40,
            child: CircleAvatar(
              backgroundColor: AppColors.main2,
              child: IconButton(
                icon: SvgPicture.asset('assets/icons/ellipsis_icon.svg'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          )
        ],
      ),
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

          return Column(
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
              Container(
                margin: const EdgeInsets.fromLTRB(16, 26, 16, 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.main2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Order Summary',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    CustomRowWidget(
                        name: 'Items', value: '${state.cart.length}'),
                    CustomRowWidget(name: 'Subtotal', value: '\$$totalPrice'),
                    const CustomRowWidget(name: 'Discount', value: '\$4'),
                    const CustomRowWidget(
                        name: 'Delivery Charges', value: '\$2'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: AppColors.grey,
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '\$$totalPrice',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
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
            ],
          );
        },
      ),
    );
  }
}
