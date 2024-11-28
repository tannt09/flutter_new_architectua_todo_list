part of 'goods_bloc.dart';

abstract class GoodsEvent extends BaseBlocEvent {
  const GoodsEvent();
}

@freezed
class GetAllGoodsEvent extends GoodsEvent with _$GetAllGoodsEvent {
  const factory GetAllGoodsEvent() = _GetAllGoodsEvent;
}

@freezed
class GetFeaturedGoodsEvent extends GoodsEvent with _$GetFeaturedGoodsEvent {
  const factory GetFeaturedGoodsEvent() = _GetFeaturedGoodsEvent;
}

@freezed
class GetMostPopularGoodsEvent extends GoodsEvent with _$GetMostPopularGoodsEvent {
  const factory GetMostPopularGoodsEvent() = _GetMostPopularGoodsEvent;
}

@freezed
class GetSearchGoodsEvent extends GoodsEvent with _$GetSearchGoodsEvent {
  const factory GetSearchGoodsEvent({required String name}) = _GetSearchGoodsEvent;
}

@freezed
class ChangeFavoriteStateEvent extends GoodsEvent
    with _$ChangeFavoriteStateEvent {
  const factory ChangeFavoriteStateEvent({required GoodsModel item}) =
      _ChangeFavoriteStateEvent;
}
