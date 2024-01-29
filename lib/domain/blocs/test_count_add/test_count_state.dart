part of 'test_count_bloc.dart';

@freezed
class TestCountState with _$TestCountState {
  const factory TestCountState.counter({
    required int number,
    List<int>? listNumber,
    required List<Item> itemList,
  }) = _Counter;
}
