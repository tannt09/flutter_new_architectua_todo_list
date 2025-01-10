part of 'goods_bloc.dart';

@freezed
class GoodsState extends BaseBlocState with _$GoodsState {
  const factory GoodsState({
    @Default(false) bool isLoadingFeature,
    @Default(false) bool isLoadingMostPopular,
    @Default(false) bool isLoading,
    @Default([]) List<GoodsModel> goods,
    @Default([]) List<GoodsModel> featuredGoodsList,
    @Default([]) List<GoodsModel> mostPopularGoodsList,
    @Default([]) List<GoodsModel> searchGoodsList,
    @Default(GoodsModel(
        id: null,
        productId: null,
        imageUrl: '',
        isFavorite: false,
        name: '',
        price: 0.00,
        star: "0.00",
        sizeProduct: [],
        company: ''))
    GoodsModel itemDetail,
  }) = _GoodsState;
}
