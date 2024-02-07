import 'package:flutter/material.dart';

import '../../pages/kitchen_order/kitchen_order_page.dart';

class ConfirmedOrderWidget extends StatelessWidget {
  final Order order;
  const ConfirmedOrderWidget({super.key, required this.order});

   @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(order.description),
            const SizedBox(height: 8.0),
            Text(order.comment),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Действие при нажатии кнопки (например, обработка заказа)
                // Ваш код здесь
              },
              child: const Text('Заказ на кухню'),
            ),
          ],
        ),
      ),
    );
  }
}