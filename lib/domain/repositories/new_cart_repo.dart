  import '../../models/item/item_model.dart';

abstract class INewCartRepository {
    List<Item> getCartList();
    void addItem(Item item);
    void removeItem(Item item);
  }

  class NewCartRepo implements INewCartRepository {
    List<Item> cartList = [];

    @override
    void addItem(Item item) {
      cartList.add(item);
    }

    @override
    void removeItem(Item item) {
      cartList.remove(item);
    }

    @override
    List<Item> getCartList() {
      return cartList;
    }
  }
