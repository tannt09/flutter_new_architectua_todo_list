import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class GoodsDetailPage extends StatefulWidget {
  final String productId;

  const GoodsDetailPage({super.key, required this.productId});

  @override
  State<GoodsDetailPage> createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  @override
  void initState() {
    super.initState();
    blocGoods.add(GetItemDetailEvent(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: BlocBuilder<GoodsBloc, GoodsState>(builder: (context, state) {
      Future<void> changeFavoriteState(GoodsModel item) async {
        final id = item.productId;
        if (id != null) {
          blocGoods.add(ChangeFavoriteStateEvent(item: item));
          blocGoods.add(GetItemDetailEvent(productId: widget.productId));
        }
      }

      return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
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
                            image: NetworkImage(changeImageLink(state
                                    .itemDetail.imageUrl.isNotEmpty
                                ? state.itemDetail.imageUrl
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
                                padding:
                                    const EdgeInsets.fromLTRB(13, 10, 10, 10),
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
                              changeFavoriteState(state.itemDetail);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 14, 12, 12),
                                child: SvgPicture.asset(
                                  'assets/icons/heart_ful_icon.svg',
                                  colorFilter: ColorFilter.mode(
                                      state.itemDetail.isFavorite
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
                          state.itemDetail.name,
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
                            state.itemDetail.star,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '( ${state.itemDetail.numberOfReview} Review)',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey5),
                          ),
                        ])
                      ],
                    ),
                    Text(
                      '\$${state.itemDetail.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.main),
                    )
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  state.itemDetail.description,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey3),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Size',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 44,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.itemDetail.sizeProduct.length,
                      itemBuilder: (context, index) {
                        final item = state.itemDetail.sizeProduct[index];
                        return CustomPaint(
                          size: const Size(44, 44),
                          painter:
                              item.quantity == 0 ? DiagonalLinePainter() : null,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: AppColors.grey6,
                                  width: 1,
                                )),
                            child: Text(
                              "${item.size}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: item.quantity == 0
                                      ? AppColors.grey
                                      : Colors.black),
                            ),
                          ),
                        );
                      })),
              Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Button Pressed!');
                      },
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
                          print('Add Cart Button Pressed!');
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
              )
            ],
          ),
        ),
      );
    }));
  }
}

class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(32, 0), const Offset(4, 41), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
