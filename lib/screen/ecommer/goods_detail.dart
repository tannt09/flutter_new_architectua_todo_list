import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class GoodsDetailPage extends StatefulWidget {
  final GoodsModel item;
  final Future<void> Function(GoodsModel item)? changeFavoriteState;

  const GoodsDetailPage(
      {super.key, required this.item, this.changeFavoriteState});

  @override
  State<GoodsDetailPage> createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GoodsBloc, GoodsState>(builder: (context, state) {
      return Column(
        children: [
          AspectRatio(
              aspectRatio: 375 / 401,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image:
                            NetworkImage(changeImageLink(widget.item.imageUrl)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 14,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(13, 10, 10, 10),
                            child: SvgPicture.asset(
                              'assets/icons/left_arrow_icon.svg',
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 50,
                      right: 14,
                      child: GestureDetector(
                        onTap: () {
                          widget.changeFavoriteState!(widget.item);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                            child: SvgPicture.asset(
                              'assets/icons/heart_ful_icon.svg',
                              colorFilter: ColorFilter.mode(
                                  widget.item.isFavorite
                                      ? AppColors.pink
                                      : AppColors.grey,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ))
                ],
              )),
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
                      Text(
                        widget.item.star,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '( 20 Review)',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey5),
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
      );
    }));
  }
}
