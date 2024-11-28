import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/api/goods_api.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_state.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'goods_event.dart';
part 'goods_state.dart';
part 'goods_bloc.freezed.dart';

@injectable
class GoodsBloc extends BaseBloc<GoodsEvent, GoodsState> {
  GoodsBloc() : super(const GoodsState()) {
    on<GetAllGoodsEvent>(_getAllGoods);
    on<GetFeaturedGoodsEvent>(_getFeaturedGoods);
    on<GetMostPopularGoodsEvent>(_getMostPopularGoods);
    on<ChangeFavoriteStateEvent>(_changeFavoriteState);
  }

  Future<void> _getAllGoods(
      GetAllGoodsEvent event, Emitter<GoodsState> emit) async {
    final List<GoodsModel> newGoods = await fetchAllGoods('goods/getAll');

    emitSafety(state.copyWith(goods: newGoods));
  }

  Future<void> _getFeaturedGoods(
      GetFeaturedGoodsEvent event, Emitter<GoodsState> emit) async {
    final List<GoodsModel> newFeaturedList = await fetchAllGoods('goods/getFeatured');

    emitSafety(state.copyWith(featuredGoodsList: newFeaturedList));
  }

  Future<void> _getMostPopularGoods(
      GetMostPopularGoodsEvent event, Emitter<GoodsState> emit) async {
    final List<GoodsModel> newMostPopularList = await fetchAllGoods('goods/getMostPopular');

    emitSafety(state.copyWith(mostPopularGoodsList: newMostPopularList));
  }

  Future<void> _getSearchGoods(
      GetSearchGoodsEvent event, Emitter<GoodsState> emit) async {
    final List<GoodsModel> searchGoodsResultList = await fetchAllGoods('goods/getMostPopular');

    emitSafety(state.copyWith(searchGoodsList: searchGoodsResultList));
  }

  Future<void> _changeFavoriteState(
      ChangeFavoriteStateEvent event, Emitter<GoodsState> emit) async {
    await fetchChangeFavorite(event.item);
  }
}
