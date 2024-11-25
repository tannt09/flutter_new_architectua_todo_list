part of 'goods_bloc.dart';

abstract class GoodsEvent extends BaseBlocEvent {
  const GoodsEvent();
}

@freezed
class GetAllGoodsEvent extends GoodsEvent with _$GetAllGoodsEvent {
  const factory GetAllGoodsEvent() = _GetAllGoodsEvent;
}

@freezed
class GetFeaturedEvent extends GoodsEvent with _$GetFeaturedEvent {
  const factory GetFeaturedEvent() = _GetFeaturedEvent;
}

@freezed
class GetMostPopularEvent extends GoodsEvent with _$GetMostPopularEvent {
  const factory GetMostPopularEvent() = _GetMostPopularEvent;
}

@freezed
class ChangeFavoriteStateEvent extends GoodsEvent
    with _$ChangeFavoriteStateEvent {
  const factory ChangeFavoriteStateEvent({required GoodsModel item}) =
      _ChangeFavoriteStateEvent;
}
