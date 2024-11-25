import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/home/carousel_slider_widget.dart';
import 'package:flutter_new_architectua/widget/home/product_list_widget.dart';
import 'package:flutter_new_architectua/widget/home/search_widget.dart';
import 'package:flutter_new_architectua/widget/home/user_information_widget.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  TextEditingController controllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    blocGoods.add(const GetFeaturedEvent());
    blocGoods.add(const GetMostPopularEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const UserInformationWidget(),
        ),
        body: GestureDetector(onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        }, child: BlocBuilder<GoodsBloc, GoodsState>(
          builder: (context, state) {
            Future<void> changeFavoriteState(GoodsModel item) async {
              final id = item.productId;
              if (id != null) {
                blocGoods.add(ChangeFavoriteStateEvent(item: item));
                blocGoods.add(const GetFeaturedEvent());
                blocGoods.add(const GetMostPopularEvent());
              }
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SearchWidget(controller: controllerSearch),
                      const CarouselSliderWidget(),
                      ListProductWidget(
                        title: 'Featured',
                        goods: state.featuredList,
                        onTap: () {
                          navigator.push(GoodsRoute());
                        },
                        changeFavoriteState: changeFavoriteState,
                      ),
                      ListProductWidget(
                        title: 'Most Popular',
                        goods: state.mostPopularList,
                        onTap: () {
                          navigator.push(GoodsRoute());
                        },
                        changeFavoriteState: changeFavoriteState,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )));
  }
}
