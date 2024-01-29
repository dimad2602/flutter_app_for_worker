import 'dart:async';

import '../../models/item_model.dart';

abstract class ICartRepository {
  //Future<List<Item>> fetchPage({required int page, required int count});
  //Stream<List<Item>> getCartItemsStream();
  List<Item> getCartItems();
  void addToCart(Item newItem);
  void removeFromCart(Item itemToRemove);
}

class CartRepo implements ICartRepository {
  List<Item> cartItems = [];
  //final _cartItemsController = StreamController<List<Item>>.broadcast();

  // @override
  // Stream<List<Item>> getCartItemsStream() => _cartItemsController.stream;

  @override
  List<Item> getCartItems() {
    return cartItems;
  }

  @override
  void addToCart(Item newItem) {
    cartItems.add(newItem);
    //_cartItemsController.add(_cartItems); // Уведомление о изменении
  }

  @override
  void removeFromCart(Item itemToRemove) {
    cartItems.remove(itemToRemove);
    //_cartItemsController.add(_cartItems); // Уведомление о изменении
  }

  // void dispose() {
  //   _cartItemsController.close();
  // }
}
