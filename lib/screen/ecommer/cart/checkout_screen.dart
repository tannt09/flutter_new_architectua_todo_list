import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/widget/cart/bill_widget.dart';
import 'package:flutter_new_architectua/widget/cart/custom_check_box.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  List<CheckBoxModel> arrayCheckBoxValue = [
    CheckBoxModel(
        id: 0,
        title: 'Paypal',
        assetIcon: 'assets/icons/paypal_icon.svg',
        isCheck: false),
    CheckBoxModel(
        id: 1,
        title: 'Credit Card',
        assetIcon: 'assets/icons/credit_card_icon.svg',
        isCheck: false),
    CheckBoxModel(
        id: 2,
        title: 'Cash',
        assetIcon: 'assets/icons/cash_icon.svg',
        isCheck: false)
  ];

  void changeCheckBoxValue(int index) {
    if (arrayCheckBoxValue[index].isCheck == false) {
      for (var item in arrayCheckBoxValue) {
        if (item.id != index) {
          item.isCheck = false;
        }
      }
      setState(() {
        arrayCheckBoxValue[index].isCheck = true;
      });
    }
  }

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
                ...arrayCheckBoxValue.map((CheckBoxModel item) {
                  return GestureDetector(
                    onTap: () {
                      changeCheckBoxValue(item.id ?? 0);
                    },
                    child: CustomCheckBoxWidget(
                      title: item.title ?? '',
                      assetIcon: item.assetIcon ?? '',
                      isCheck: item.isCheck ?? false,
                    ),
                  );
                }).toList(),
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
                  onTap: () {
                    navigator.push(PaymentCreditCardRoute());
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

class CheckBoxModel {
  final int? id;
  final String? title;
  final String? assetIcon;
  bool? isCheck;

  CheckBoxModel({
    this.id,
    this.title,
    this.assetIcon,
    this.isCheck,
  });
}
