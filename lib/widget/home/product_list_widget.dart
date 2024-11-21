import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';

class ListProductWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ListProductWidget(
      {super.key, required this.title, required this.onTap});

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
              itemCount: 4,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: ItemProductWidget(
                    goods: GoodsModel(
                      id: 0,
                      productId: 'db3a22e2-f1d4-4e69-90f7-f9e18f3cb67b',
                      imageUrl:
                          'http://localhost:3000/images/1732000863903-watch.jpg',
                      isFavorite: false,
                      name: 'Watch',
                      price: 40.00,
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
