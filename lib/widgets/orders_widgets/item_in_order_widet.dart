import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

class ItemInOrderWidget extends StatelessWidget {
  final Order order;
  final bool? waiter;
  const ItemInOrderWidget({
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
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  waiter == false ?
                  const Icon(
                    color: AppColors.lightGreenColor,
                    Icons.free_breakfast,
                    size: 24,
                  ):const SizedBox.shrink(),
                  waiter == false ?
                  const SizedBox(
                    width: 4,
                  ):const SizedBox.shrink(),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: waiter == false
                          ? _screenWidth * 0.16
                          : _screenWidth * 0.55,
                    ),
                    child: BigText(
                      text:
                          "${order.id} + dffffffffffffffffffffffffffffffffffgdffffffg12312414567575675757",
                      bold: true,
                      maxLines: 2,
                      color: order.id > 1 ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      child: Container(
                          color: AppColors.lightGreenColor,
                          padding: const EdgeInsets.all(4),
                          child:  BigText(bold: true, text: waiter == false ? "Начать": "ГОТОВ"))),
                  waiter == false ?
                  const SizedBox(
                    width: 4,
                  ): const SizedBox.shrink(),
                  waiter == false ?
                  const Icon(
                    color: Colors.black,
                    Icons.done,
                    size: 24,
                  ): const SizedBox.shrink(),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: Container(
              color: Colors.grey[300],
              child: const BigText(
                text: "Готовить позже, убрать ананас",
              ),
            ),
          )
        ],
      ),
    );
  }
}
