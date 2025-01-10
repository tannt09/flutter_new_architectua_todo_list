import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/goods_skeleton_widget.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';
import 'package:flutter_new_architectua/widget/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    blocGoods.add(GetSearchGoodsEvent(name: searchController.text));
  }

  Future<void> handleRefresh(String name) async {
    blocGoods.add(GetSearchGoodsEvent(name: searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: SearchWidget(controller: searchController),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BlocBuilder<GoodsBloc, GoodsState>(
          builder: (context, state) {
            Future<void> changeFavoriteState(GoodsModel item) async {
              final id = item.productId;
              if (id != null) {
                blocGoods.add(ChangeFavoriteStateEvent(item: item));
                blocGoods.add(GetSearchGoodsEvent(name: searchController.text));
              }
            }

            return RefreshIndicator(
                displacement: 80,
                onRefresh: () => handleRefresh(searchController.text),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Results for ',
                                    style: const TextStyle(
                                        color: AppColors.grey4,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '“ ${searchController.text} “',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "${state.searchGoodsList.length} Results Found",
                                  style: const TextStyle(
                                    color: AppColors.main,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          state.isLoading
                              ? const GoodsSkeletonWidget()
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 20),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 25,
                                    childAspectRatio: 155 / 178,
                                  ),
                                  itemCount: state.searchGoodsList.length,
                                  itemBuilder: (context, index) {
                                    final item = state.searchGoodsList[index];
                                    return ItemProductWidget(
                                        goods: item,
                                        changeFavoriteState:
                                            changeFavoriteState);
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
