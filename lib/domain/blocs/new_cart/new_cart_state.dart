part of 'new_cart_bloc.dart';

@freezed
class NewCartState with _$NewCartState {
  const factory NewCartState.cart({
    required List<Item> cartList,
  }) = _Cart;
}
