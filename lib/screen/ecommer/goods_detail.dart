import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class GoodsDetailPage extends StatefulWidget {
  final GoodsModel item;
  const GoodsDetailPage({super.key, required this.item});

  @override
  State<GoodsDetailPage> createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 375 / 401, // Tỷ lệ ảnh
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: NetworkImage(changeImageLink(widget.item.imageUrl)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 26, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      SvgPicture.asset(
                        'assets/icons/star_icon.svg',
                        colorFilter: const ColorFilter.mode(
                            AppColors.yellow, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '4.5',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '( 20 Review)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.grey5),
                      ),
                    ])
                  ],
                ),
                Text(
                  '\$${widget.item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.main),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
