import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_event.dart';
import 'package:flutter_new_architectua/core/bloc/base/bloc/base_bloc_state.dart';

import '../../../navigation/app_navigator.dart';


abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final AppNavigator navigator;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    }
  }
}
