part of 'goods_bloc.dart';

@freezed
class GoodsState extends BaseBlocState with _$GoodsState {
  const factory GoodsState({
    @Default([]) List<GoodsModel> goods,
  }) = _GoodsState;
}