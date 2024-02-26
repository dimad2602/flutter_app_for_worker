import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';

class CompliteItemInOrderWidget extends StatelessWidget {
  final Order order;
  final bool? waiter;
  const CompliteItemInOrderWidget({
    super.key,
    required this.order,
    this.waiter = false,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 12),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                      text:
                          "${order.id}",
                      bold: true,
                      color: Colors.grey[600],
                    ),
                  const SizedBox(width: 4,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: waiter == false
                          ? _screenWidth * 0.16
                          : _screenWidth * 0.55,
                    ),
                    child: BigText(
                      text:
                          "dffffffffffffffffffffffffffffffffffgdffffffg12312414567575675757",
                      bold: true,
                      color: Colors.grey[600],
                      lineThrough: true,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "ВЫДАН", color: Colors.grey[600], bold: true,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
