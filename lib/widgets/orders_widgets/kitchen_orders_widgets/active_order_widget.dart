import 'package:flutter/material.dart';

import '../../../models/active_order_model.dart';

class ActiveOrderWidget extends StatelessWidget {
  final ActiveOrderModel orderModel;
  const ActiveOrderWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("Заказ #${orderModel.id}"),
        subtitle: Text("Стол: ${orderModel.tableNumber}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                // Действие при нажатии на информацию о заказе
                //_showOrderDetailsDialog(context, order);
              },
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Действие при подтверждении заказа
                //_confirmOrder(context, order);
              },
            ),
          ],
        ),
      ),
    );
  }
}
