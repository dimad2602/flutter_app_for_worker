import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/test_count_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/item/item_model.dart';

part 'test_count_event.dart';
part 'test_count_state.dart';
part 'test_count_bloc.freezed.dart';

class TestCountBloc extends Bloc<TestCountEvent, TestCountState> {
  final ITestCountRepository _repository;
  TestCountBloc(this._repository)
      : super(const TestCountState.counter(number: 0, itemList: [])) {
    on<TestCountEvent>((event, emit) async {
      await event.map(
        //started: (_) => _started(_, emit),
        addCount: (_) => _addCount(_, emit),
        reduceCount: (_) => _reduceCount(_, emit),
        addItem: (value) => _addItem(value, emit),
      );
    });
  }

  // FutureOr<void> _started(_Started value, Emitter<TestCountState> emit) async {
  //   final count = await _repository.getCount();
  //   emit(TestCountState.counter(number: count));
  // }

  FutureOr<void> _addCount(
      _AddCount value, Emitter<TestCountState> emit) async {
    print("_addCount");
    _repository.addCount();
    final count = await _repository.getNumber();
    print(count);
    final list = _repository.getlistNumber();
    final itemList = _repository.getlistItem();
    emit(TestCountState.counter(
        number: count, listNumber: list, itemList: itemList));
  }

  FutureOr<void> _reduceCount(
      _ReduceCount value, Emitter<TestCountState> emit) async {
    print("_reduceCount");
    _repository.reduceCount();
    final count = await _repository.getNumber();
    print(count);
    final list = _repository.getlistNumber();
    final itemList = _repository.getlistItem();
    emit(TestCountState.counter(
        number: count, listNumber: list, itemList: itemList));
  }
  FutureOr<void> _addItem(_AddItem value, Emitter<TestCountState> emit) async {
  print('_addItem');
  print('${value.item}');
  await _repository.addItem(value.item);
  final count = await _repository.getNumber();
  final list = _repository.getlistNumber();
  final itemList = List<Item>.from(_repository.getlistItem()); // Создаем копию списка
  print('itemList = ${itemList.length}');

  emit(TestCountState.counter(
      number: count, listNumber: list, itemList: itemList));
}

  // FutureOr<void> _addItem(_AddItem value, Emitter<TestCountState> emit) async {
  //   print('_addItem');
  //   print('${value.item}');
  //   await _repository.addItem(value.item);
  //   final count = await _repository.getNumber();
  //   final list = _repository.getlistNumber();
  //   final itemList = List<Item>.from(_repository.getlistItem()); 
  //   // Используйте itemList.length
  //   print('itemList = ${itemList.length}');

  //   // Теперь, после вызова emit, state будет обновлен
  //   emit(TestCountState.counter(
  //       number: count, listNumber: list, itemList: itemList));

  //   // Используйте state.itemList.length
  //   print('itemList state = ${state.itemList.length}');
  // }
}
