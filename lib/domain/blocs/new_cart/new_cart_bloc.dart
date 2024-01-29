import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/new_cart_repo.dart';
import 'package:flutter_app_for_worker/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_cart_event.dart';
part 'new_cart_state.dart';
part 'new_cart_bloc.freezed.dart';

class NewCartBloc extends Bloc<NewCartEvent, NewCartState> {
  final INewCartRepository _repository;
  NewCartBloc(this._repository) : super(const NewCartState.cart(cartList: [])) {
    on<NewCartEvent>((event, emit) async {
      await event.map(
          addItem: (_) => _addItem(_, emit),
          removeItem: (_) => _removeItem(_, emit));
    });
  }

  FutureOr<void> _addItem(_AddItem _addItem, Emitter<NewCartState> emit) {
    print("_addItem");
    _repository.addItem(_addItem.item);
    final list = _repository.getCartList();
    emit(NewCartState.cart(cartList: list));
  }

  FutureOr<void> _removeItem(
      _RemoveItem _removeItem, Emitter<NewCartState> emit) {
    print("_removeItem");
    _repository.removeItem(_removeItem.item);
    final list = _repository.getCartList();
    emit(NewCartState.cart(cartList: list));
  }
}
