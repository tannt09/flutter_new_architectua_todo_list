import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/model/item_cart_model.dart';
import 'package:flutter_svg/svg.dart';

class AddCartAndBuyButtonWidget extends StatelessWidget {
  final GoodsModel item;
  final double screenWidth;
  const AddCartAndBuyButtonWidget(
      {super.key, required this.screenWidth, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: screenWidth * 0.66,
              height: 50,
              margin: const EdgeInsets.only(right: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                blocCart.add(
                    AddToCartEvent(item: ItemCartModel.fromGoodsModel(item)));
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.main2,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SvgPicture.asset("assets/icons/cart_icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
