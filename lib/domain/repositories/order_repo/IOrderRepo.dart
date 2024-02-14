import 'package:flutter_app_for_worker/models/order/order.dart';

abstract class IOrderRepo {
  //Order getOrders();

  //Future<List<Order>> fetchOrders({required int id});

  //Stream<List<Order>> genStream(int restId);
  Stream<List<Order>> get ordersStream;


  void dispose();
}
