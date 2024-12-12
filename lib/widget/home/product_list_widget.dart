import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';

class ListProductWidget extends StatelessWidget {
  final String title;
  final List<GoodsModel> goods;
  final VoidCallback onTap;
  final Future<void> Function(GoodsModel item) changeFavoriteState;

  const ListProductWidget(
      {super.key,
      required this.title,
      required this.goods,
      required this.onTap,
      required this.changeFavoriteState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                InkWell(
                  onTap: onTap,
                  child: const Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: AppColors.main),
                  ),
                ),
              ],
            )),
        SizedBox(
            height: 204,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: goods.length,
              itemBuilder: (context, index) {
                final item = goods[index];

                return Container(
                  width: 170,
                  padding: const EdgeInsets.only(right: 14),
                  child: ItemProductWidget(
                    isAddCart: false,
                    goods: item,
                    changeFavoriteState: changeFavoriteState,
                  ),
                );
              },
            )),
      ],
    );
  }
}
