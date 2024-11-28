import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';
import 'package:flutter_new_architectua/widget/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    blocGoods.add(const GetSearchGoodsEvent(name: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: SearchWidget(controller: controllerSearch),
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
                blocGoods.add(GetSearchGoodsEvent(name: controllerSearch.text));
              }
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(
                              TextSpan(
                                text: 'Results for ',
                                style: TextStyle(
                                    color: AppColors.grey4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '“ Shoes “',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "6 Results Found",
                              style: TextStyle(
                                color: AppColors.main,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1,
                        ),
                        itemCount: state.searchGoodsList.length,
                        itemBuilder: (context, index) {
                          final item = state.searchGoodsList[index];
                          return ItemProductWidget(
                              goods: item,
                              changeFavoriteState: changeFavoriteState);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
