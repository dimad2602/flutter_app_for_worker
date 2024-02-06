import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/cart_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/cart/cart_model.dart';
import '../../../models/item/item.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _repository;

  // StreamSubscription<List<Item>>?
  //     _cartItemsSubscription; //late StreamSubscription<List<Item>> _cartItemsSubscription;

  CartBloc(this._repository) : super(const CartState.cart(items: [])) {
    on<CartEvent>((event, emit) async {
      await event.map(
        //started: (value) => _started(value, emit),
        addToCartEvent: (value) => _addToCartEvent(value, emit),
        removeFromCartEvent: (value) => _removeFromCartEvent(value, emit),
        //cartUpdated: (value) => _cartUpdated(value, emit),
      );
    });

    //Подписываемся на stream
    // _cartItemsSubscription = _repository.getCartItemsStream().listen(
    //   (cartItems) {
    //     add(CartEvent.cartUpdated(cartItems: cartItems));
    //   },
    // );
  }

  // FutureOr<void> _cartUpdated(
  //     _CartUpdated value, Emitter<CartState> emit) async {
  //   print("_cartUpdated");
  //   emit(CartState.cart(items: value.cartItems));
  // }

  // FutureOr<void> _started(_Started value, Emitter<CartState> emit) async {
  //   print("_initialize");
  //   await Future.delayed(const Duration(seconds: 1));
  //   emit(CartState.cart(items: _repository.getCartItems()));
  //   print(_repository.getCartItems());
  // }

  FutureOr<void> _addToCartEvent(
      _AddToCartEvent value, Emitter<CartState> emit) {
    print("_addToCartEvent");
    _repository.addToCart(value.item);

    _repository.addItem(value.item, 1); // добавляем один элемент
    final cartListItems = _repository
        .getItemsCart()
        .values
        .toList(); // получаем все элементы корзины

    print("cartListItems =  $cartListItems");

    final itemList =
        List<Item>.from(_repository.getCartItems()); // Создаем копию списка
    emit(CartState.cart(items: itemList, cartModel: cartListItems));
  }

  FutureOr<void> _removeFromCartEvent(
      _RemoveFromCartEvent value, Emitter<CartState> emit) {
    print("_removeFromCartEvent");
    print("Old Cart len: ${_repository.getCartItems().length}");
    _repository.removeFromCart(value.item);

    _repository.addItem(value.item, -1);

    final cartListItems = _repository
        .getItemsCart()
        .values
        .toList(); // получаем все элементы корзины

    print("cartListItems =  $cartListItems");

    final itemList = List<Item>.from(_repository.getCartItems());
    print("New Cart: ${itemList}");
    emit(CartState.cart(items: itemList, cartModel: cartListItems));
  }

  // @override
  // Future<void> close() {
  //   _cartItemsSubscription?.cancel();
  //   return super.close();
  // }
}
