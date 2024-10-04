import 'package:flutter_new_architectua/utils/bloc_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/bloc/base_bloc.dart';
import '../base/bloc/base_bloc_event.dart';
import '../base/bloc/base_bloc_state.dart';

part 'count_bloc.freezed.dart';
part 'count_event.dart';
part 'count_state.dart';

@injectable
class CountBloc extends BaseBloc<CountEvent, CountState> {
  CountBloc() : super(const CountState()) {
    on<Count>(_onCount);
  }

  void _onCount(Count event, Emitter<CountState> emit) {
    emitSafety(state.copyWith(count: state.count + 1));
  }
}
