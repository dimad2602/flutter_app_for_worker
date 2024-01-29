part of 'test_count_bloc.dart';

@freezed
class TestCountEvent with _$TestCountEvent {
  const factory TestCountEvent.addCount({
    required int index,
  }) = _AddCount;

  const factory TestCountEvent.addItem({
    required Item item,
  }) = _AddItem;

  const factory TestCountEvent.reduceCount({
    required int index,
  }) = _ReduceCount;
}