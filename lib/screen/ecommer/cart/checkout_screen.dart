import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/widget/cart/bill_widget.dart';
import 'package:flutter_new_architectua/widget/cart/custom_check_box.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
          leftIcon: 'assets/icons/left_arrow_icon.svg', title: 'Check Out'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          backgroundColor: AppColors.main2,
                          child: IconButton(
                            icon: SvgPicture.asset('assets/icons/gps_icon.svg'),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('325 15th Eighth Avenue, NewYork',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Text('Saepe eaque fugiat ea voluptatum veniam.',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.grey3)),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: AppColors.blue,
                        child: IconButton(
                          icon: SvgPicture.asset('assets/icons/clock_icon.svg'),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                    const Text('6:00 pm, Wednesday 20',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                BillWidget(
                    totalPrice: totalPrice, cartLength: state.cart.length),
                const Text(
                  'Choose payment method',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const CustomCheckBoxWidget(
                  title: 'Paypal',
                  assetIcon: 'assets/icons/paypal_icon.svg',
                  isCheck: false,
                ),
                const CustomCheckBoxWidget(
                  title: 'Credit Card',
                  assetIcon: 'assets/icons/credit_card_icon.svg',
                  isCheck: true,
                ),
                const CustomCheckBoxWidget(
                  title: 'Cash',
                  assetIcon: 'assets/icons/cash_icon.svg',
                  isCheck: false,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add new payment method',
                        style: TextStyle(fontSize: 16),
                      ),
                      SvgPicture.asset(
                        'assets/icons/add_around_blue_icon.svg',
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
