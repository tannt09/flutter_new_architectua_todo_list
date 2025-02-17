import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/model/item_cart_model.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class ItemProductWidget extends StatelessWidget {
  final bool isAddCart;
  final GoodsModel goods;
  final Future<void> Function(GoodsModel item)? changeFavoriteState;
  const ItemProductWidget(
      {super.key,
      required this.goods,
      this.changeFavoriteState,
      this.isAddCart = true});

  @override
  Widget build(BuildContext context) {
    late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  navigator
                      .push(GoodsDetailRoute(productId: goods.productId ?? ''));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(changeImageLink(goods.imageUrl)),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: IconButton(
                  icon: SvgPicture.asset(goods.isFavorite
                      ? 'assets/icons/heart_ful_icon.svg'
                      : 'assets/icons/heart_icon.svg'),
                  onPressed: () {
                    changeFavoriteState!(goods);
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.main2,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goods.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      '\$${goods.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.main),
                    ),
                  ],
                ),
                isAddCart
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            blocCart.add(AddToCartEvent(
                                item: ItemCartModel.fromGoodsModel(goods)));
                          },
                          child: SvgPicture.asset('assets/icons/add_icon.svg'),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
