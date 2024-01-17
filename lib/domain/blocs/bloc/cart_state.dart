part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState.initial() = _Initial;

  const factory CartState.cart({
    required List<Item> items,
  }) = _Cart;

  List<Item>? get Items {
    return mapOrNull(
        //initial: () => null,
        cart: (value) => value.items,
        //searchInput: searchInput,
        //loading: loading,
        //failure: (value) => value.items
    );
  }
}
