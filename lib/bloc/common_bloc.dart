import 'package:flutter_new_architectua/base/bloc/base_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../base/bloc/base_bloc_state.dart';
import 'common_event.dart';

part 'common_state.dart';
part 'common_bloc.freezed.dart';

@injectable
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState());
}
