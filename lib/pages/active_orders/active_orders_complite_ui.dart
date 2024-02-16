import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/app_icon.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/active_orders_waiter_widget/active_orders_waiter_widget.dart';

Widget activeOrdersCompliteUI(BuildContext context, List<Order> ordersList) {
  return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: CustomAppBar(
        label: "Заказы",
        rightAppIconFirst: AppIcon(
          icon: Icons.notifications_none,
          iconColor: Colors.black,
          backgroundColor: AppColors.mainColorAppbar,
          iconSize24: true,
          onTap: () {
            //Navigator.of(context).pushNamed('/CartPage');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ordersList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //childAspectRatio: 3 / 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
            ),
            itemBuilder: (context, index) {
              final order = ordersList[index];
              return ActiveOrdersWaiterWidget(order: order);
            }),
      ));
}
