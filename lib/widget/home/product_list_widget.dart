import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';

class ListProductWidget extends StatelessWidget {
  final bool isLoading;
  final String title;
  final List<GoodsModel> goods;
  final VoidCallback onTap;
  final Future<void> Function(GoodsModel item) changeFavoriteState;

  const ListProductWidget(
      {super.key,
      this.isLoading = false,
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
            child: isLoading
                ? Shimmer.fromColors(
                    baseColor: AppColors.grey6,
                    highlightColor: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170,
                          padding: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      color: AppColors.grey6),
                                ),
                              ),
                              Container(
                                height: 44,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 6,
                                      width: double.infinity,
                                      color: AppColors.grey6,
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 6,
                                      width: 40,
                                      color: AppColors.grey6,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ))
                : ListView.builder(
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
