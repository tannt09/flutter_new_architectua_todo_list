import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/goods_detail/button_add_cart_buy.dart';
import 'package:flutter_new_architectua/widget/goods_detail/item_image_widget.dart';
import 'package:flutter_new_architectua/widget/goods_detail/item_size_widget.dart';
import 'package:flutter_new_architectua/widget/goods_detail/item_star_name_price_widget.dart';

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
      Future<void> onChangeFavorite(GoodsModel item) async {
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
              ItemImageWidget(
                  itemDetail: state.itemDetail,
                  onChangeFavorite: onChangeFavorite),
              ItemStarNamePriceWidget(
                itemDetail: state.itemDetail,
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
              ItemSizeWidget(itemDetail: state.itemDetail),
              ButtonAddCartAndBuyWidget(screenWidth: screenWidth),
            ],
          ),
        ),
      );
    }));
  }
}
