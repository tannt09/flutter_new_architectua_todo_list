part of 'count_bloc.dart';

abstract class CountEvent extends BaseBlocEvent {
  const CountEvent();
}

@freezed
class Count extends CountEvent with _$Count {
  const factory Count() = _Count;
}
