import '../../models/item/item.dart';

abstract class ITestCountRepository {
  Future<int> getNumber();
  List<int> getlistNumber();
  List<Item> getlistItem();
  void addCount();
  Future<void> addItem(Item item);
  void reduceCount();
}

class TestCountRepo implements ITestCountRepository {
  int number = 0;
  List<int> listNumber = [];
  List<Item> listItem = [];

  @override
  void addCount() {
    listNumber.add(number);
    number = number + 1;
  }

  @override
  Future<void> addItem(Item item) async {
    listItem.add(item);
  }

  @override
  void reduceCount() {
    listNumber.remove(number);
    number = number - 1;
  }

  @override
  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 1));
    return number;
  }

  @override
  List<int> getlistNumber() {
    return listNumber;
  }

  @override
  List<Item> getlistItem() {
    return listItem;
  }
}
