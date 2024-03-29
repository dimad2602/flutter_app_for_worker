import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/medium_text.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

class ActiveOrdersWaiterWidget extends StatelessWidget {
  final Order order;
  const ActiveOrdersWaiterWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    double orderCost = order.items != null
        ? order.items!.fold(
            0,
            (previousValue, element) =>
                previousValue + (element.amount ?? 0) * element.item.price)
        : 0;
    return Container(
      decoration: BoxDecoration(
          color: order.status == "Поступил"
              ? Colors.grey[300]
              : order.status == "Готов к выдаче"
                  ? AppColors.lightGreenColor
                  : order.status == "Вызывают официанта"
                      ? Colors.red[200]
                      : order.status == "Просят счет"
                          ? Colors.red[200]
                          : Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 4, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                appbar: true,
                bold: true,
                text: order.id.toString(),
              ),
              BigText(
                text: '$orderCost Р',
              ),
              MediumText(
                text: order.status,
                maxLines: 2,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.notifications_none,
                            color: AppColors.liteMainColor,
                          ),
                          MediumText(
                            text: "СТОЛ",
                            color: AppColors.liteMainColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  BigText(
                    text: '0:52',
                    color: AppColors.liteMainColor,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
