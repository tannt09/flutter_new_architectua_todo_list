import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/widget/home/carousel_slider_widget.dart';
import 'package:flutter_new_architectua/widget/home/product_list_widget.dart';
import 'package:flutter_new_architectua/widget/search_widget.dart';
import 'package:flutter_new_architectua/widget/home/user_information_widget.dart';
import 'package:get_it/get_it.dart';

Future<void> _getUserProfile() async {
  blocProfile.add(
      GetUserProfileEvent(userId: await storage.read(key: 'user_id') ?? ''));
}

Future<void> _handleRefresh() async {
  _getUserProfile();
  blocGoods.add(const GetFeaturedGoodsEvent());
  blocGoods.add(const GetMostPopularGoodsEvent());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserProfile();
    blocGoods.add(const GetFeaturedGoodsEvent());
    blocGoods.add(const GetMostPopularGoodsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: UserInformationWidget(
              profile: state.profile,
            ),
          ),
          body: GestureDetector(onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          }, child: BlocBuilder<GoodsBloc, GoodsState>(
            builder: (context, stateGoods) {
              Future<void> changeFavoriteState(GoodsModel item) async {
                final id = item.productId;
                if (id != null) {
                  blocGoods.add(ChangeFavoriteStateEvent(item: item));
                }
              }

              return RefreshIndicator(
                  displacement: 80,
                  onRefresh: () => _handleRefresh(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: <Widget>[
                            SearchWidget(controller: searchController),
                            const CarouselSliderWidget(),
                            ListProductWidget(
                              title: 'Featured',
                              goods: stateGoods.featuredGoodsList,
                              onTap: () {
                                navigator.push(GoodsRoute());
                              },
                              isLoading: stateGoods.isLoadingFeature,
                              changeFavoriteState: changeFavoriteState,
                            ),
                            ListProductWidget(
                              title: 'Most Popular',
                              goods: stateGoods.mostPopularGoodsList,
                              onTap: () {
                                navigator.push(GoodsRoute());
                              },
                              isLoading: stateGoods.isLoadingMostPopular,
                              changeFavoriteState: changeFavoriteState,
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          )));
    });
  }
}
