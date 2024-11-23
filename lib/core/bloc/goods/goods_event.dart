part of 'goods_bloc.dart';

abstract class GoodsEvent extends BaseBlocEvent {
  const GoodsEvent();
}

@freezed
class GetAllGoodsEvent extends GoodsEvent with _$GetAllGoodsEvent {
  const factory GetAllGoodsEvent() = _GetAllGoodsEvent;
}

@freezed
class ChangeFavoriteStateEvent extends GoodsEvent with _$ChangeFavoriteStateEvent {
  const factory ChangeFavoriteStateEvent({required GoodsModel item}) = _ChangeFavoriteStateEvent;
}
