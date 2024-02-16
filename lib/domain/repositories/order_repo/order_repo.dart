import 'dart:async';

import 'package:flutter_app_for_worker/domain/api/api_provider.dart';
import 'package:flutter_app_for_worker/domain/repositories/order_repo/IOrderRepo.dart';
import 'package:flutter_app_for_worker/locator_get.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/api_constants.dart';
import 'dart:convert';

class OrdersRepo implements IOrderRepo {
  late List<Order> orderList = [];
  final ApiProvider apiProvider = locator.get<ApiProvider>();

  final _ordersController = StreamController<List<Order>>.broadcast();

  //Stream<List<Order>> get ordersStream => _ordersController.stream;

  @override
  Stream<List<Order>> get ordersStream {
    // Вызываем метод fetchOrders при первом подписывании на стрим
    fetchOrders(1);
    return _ordersController.stream;
  }

  void updateOrders(List<Order> newOrders) {
    orderList = newOrders;
    _ordersController.add(orderList); // Отправляем обновленные данные по потоку
  }

  // @override
  // Future<List<Order>> fetchOrders({required int id}) {
  //   // TODO: implement fetchOrders
  //   throw UnimplementedError();
  // }

  // Future<void> fetchOrders({required int id}) async {
  //   try {
  //     var token = apiProvider.token;
  //     final response = await apiProvider.getData(AppConstants.ORDER_LIST, headers: {"Authorization": "Bearer $token"});

  //     if (response.statusCode == 200) {
  //       orderList = Order.fromJson(json.decode(response.body));
  //       _ordersController.sink.add(orderList);
  //     } else {
  //       throw Exception('Failed to fetch orders');
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Order getOrders() {

  //   throw UnimplementedError();
  // }

  // @override
  // Stream<List<Order>> genStream(int restId) => Stream.fromFuture(
  //       getOrderById(id: restId),
  //     ); //periodic(const Duration(milliseconds: 500), (list) => list,);

  // Future<List<Order>> getOrderById({required int id}) async {
  //   print('getOrderById start');
  //   try {
  //     var token = apiProvider
  //         .token; //sharedPreferences.getString(AppConstants.TOKEN)??"";

  //     final response = await apiProvider.getData(AppConstants.ORDER_LIST,
  //         headers: {"Authorization": "Bearer $token"});

  //     print('response ${response.statusCode}');
  //     print('response ${response.body}');
  //     if (response.statusCode == 200) {
  //       try {
  //         final order = Order.fromJson(json.decode(response.body));

  //         orderList.add(order);
  //       } catch (e) {
  //         //print('response restaurant error $e');
  //         //print('response restaurant error ${e.toString()}');
  //         rethrow;
  //       }
  //     }

  //     return orderList;
  //   } catch (e) {
  //     print('getOrderById error');
  //     rethrow;
  //   }
  // }

  Future<void> fetchOrders(int restId) async {
    print("fetchOrders start");
    try {
      var token = apiProvider.token;

      final response = await apiProvider.getData(
          AppConstants.ORDER_LIST.toString(),
          headers: {"Authorization": "Bearer $token"}
          );

      print("fetchOrders ${response.statusCode}");
      print("fetchOrders ${response.body}");
      if (response.statusCode == 200) {
        final List<Order> orders = List<Order>.from(
          json.decode(response.body).map((data) => Order.fromJson(data)),
        );
        _ordersController.add(orders);
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw Exception('Failed to fetch orders: $e');
    }
  }

  @override
  void dispose() {
    _ordersController.close();
  }
}
