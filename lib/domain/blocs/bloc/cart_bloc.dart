import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<Item> cart = [];

  CartBloc() : super(const CartState.initial()) {
    on<CartEvent>((event, emit) async {
      await event.map(
        started: (value) => _started(value, emit),
        addToCartEvent: (value) => _addToCartEvent(value, emit), 
        removeFromCartEvent: (value) => _removeFromCartEvent(value, emit),
      );
    });
  }

  FutureOr<void> _started(_Started value, Emitter<CartState> emit) async {
    print("_initialize");
    await Future.delayed(const Duration(seconds: 3));
    // emit(ListSearchState.loading());
    // final items = await _repository.fetchList();
    emit(CartState.cart(items: cart));
  }

  FutureOr<void> _addToCartEvent(
      _AddToCartEvent value, Emitter<CartState> emit) {
    print("_addToCartEvent");
    cart.add(value.item);

    print("Cart: ${cart}");
  }

  FutureOr<void> _removeFromCartEvent(
      _RemoveFromCartEvent value, Emitter<CartState> emit) {
    print("_removeFromCartEvent");
    cart.remove(value.item);
    print("Cart: ${cart}");
  }
}
