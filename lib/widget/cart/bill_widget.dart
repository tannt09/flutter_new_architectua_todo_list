import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/widget/cart/custom_row_widget.dart';

class BillWidget extends StatelessWidget {
  final double totalPrice;
  final int cartLength;
  const BillWidget({super.key, required this.totalPrice, required this.cartLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26, bottom: 20),
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CustomRowWidget(name: 'Items', value: '$cartLength'),
          CustomRowWidget(name: 'Subtotal', value: '\$$totalPrice'),
          const CustomRowWidget(name: 'Discount', value: '\$4'),
          const CustomRowWidget(name: 'Delivery Charges', value: '\$2'),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
    );
  }
}
