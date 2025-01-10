import 'package:auto_route/annotations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/header_widget.dart';
import 'package:flutter_new_architectua/widget/home/goods_skeleton_widget.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';

Future<void> _changeFavoriteState(GoodsModel item) async {
  final id = item.productId;
  if (id != null) {
    blocGoods.add(ChangeFavoriteStateEvent(item: item));
    blocGoods.add(const GetAllGoodsEvent());
  }
}

Future<void> _handleRefresh() async {
  blocGoods.add(const GetAllGoodsEvent());
}

@RoutePage()
class GoodsPage extends StatefulWidget {
  final String title;
  const GoodsPage({super.key, this.title = "Products"});

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  @override
  void initState() {
    super.initState();
    blocGoods.add(const GetAllGoodsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        leftIcon: 'assets/icons/left_arrow_icon.svg',
        title: widget.title,
      ),
      body: BlocBuilder<GoodsBloc, GoodsState>(builder: (context, state) {
        if (!state.goods.isNotEmpty) {
          return const GoodsSkeletonWidget();
        }

        return RefreshIndicator(
            onRefresh: () => _handleRefresh(),
            child: state.isLoading
                ? const GoodsSkeletonWidget()
                : GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 25,
                      childAspectRatio: 155 / 178,
                    ),
                    itemCount: state.goods.length,
                    itemBuilder: (context, index) {
                      final item = state.goods[index];
                      return ItemProductWidget(
                        goods: item,
                        changeFavoriteState: _changeFavoriteState,
                      );
                    },
                  ));
      }),
    );
  }
}
