part of 'goods_bloc.dart';

abstract class GoodsEvent extends BaseBlocEvent {
  const GoodsEvent();
}

@freezed
class GetAllGoods extends GoodsEvent with _$GetAllGoods {
  const factory GetAllGoods() = _GetAllGoods;
}
