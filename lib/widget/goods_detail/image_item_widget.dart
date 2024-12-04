import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/svg.dart';

class ImageItemWidget extends StatelessWidget {
  final GoodsModel itemDetail;
  final Future<void> Function(GoodsModel item) onChangeFavorite;
  const ImageItemWidget(
      {super.key, required this.itemDetail, required this.onChangeFavorite});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
                  image: NetworkImage(changeImageLink(itemDetail
                          .imageUrl.isNotEmpty
                      ? itemDetail.imageUrl
                      : 'http://localhost:3000/images/1733114777827-default.png')),
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
                    onChangeFavorite(itemDetail);
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
                            itemDetail.isFavorite
                                ? AppColors.pink
                                : AppColors.grey,
                            BlendMode.srcIn),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
