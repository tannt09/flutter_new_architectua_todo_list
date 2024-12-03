import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_svg/svg.dart';

class ItemStarNamePriceWidget extends StatelessWidget {
  final GoodsModel itemDetail;
  const ItemStarNamePriceWidget({super.key, required this.itemDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 26, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemDetail.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(children: [
                SvgPicture.asset(
                  'assets/icons/star_icon.svg',
                  colorFilter:
                      const ColorFilter.mode(AppColors.yellow, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Text(
                  itemDetail.star,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 6),
                Text(
                  '( ${itemDetail.numberOfReview} Review)',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey5),
                ),
              ])
            ],
          ),
          Text(
            '\$${itemDetail.price.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.main),
          )
        ],
      ),
    );
  }
}
