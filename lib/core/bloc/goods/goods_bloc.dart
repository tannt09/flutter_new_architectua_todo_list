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
    on<GetAllGoods>(_getAllGoods);
  }

  Future<void> _getAllGoods(GetAllGoods event, Emitter<GoodsState> emit) async {
    final List<GoodsModel> newGoods = await fetchAllGoods();

    emitSafety(state.copyWith(products: newGoods));
  }
}
