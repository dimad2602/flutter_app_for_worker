import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

import '../../components/custom_app_bar.dart';
import '../../widgets/orders_widgets/confirmed_orders_widget.dart';

class KitchenOrderPage extends StatelessWidget {
  KitchenOrderPage({super.key});

  final List<Order> orders = [
    Order(
      title: "Заказ #1",
      description: "Пицца, напиток",
      comment: "Без острых приправ",
    ),
    Order(
      title: "Заказ #2",
      description: "Бургер, картошка фри",
      comment: "Доставить к 18:00",
    ),
    Order(
      title: "Заказ #3",
      description: "Бургер, картошка фри",
      comment: "Доставить к 18:00",
    ),
    Order(
      title: "Заказ #4",
      description: "Бургер, картошка фри",
      comment: "Доставить к 18:00",
    ),
    Order(
      title: "Заказ #5",
      description: "Бургер, картошка фри",
      comment: "Доставить к 18:00",
    ),
    // Добавьте другие заказы по мере необходимости
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (didPop) async {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        },
        // onWillPop: () async {
        //   SystemChrome.setPreferredOrientations([
        //     DeviceOrientation.portraitUp,
        //     DeviceOrientation.portraitDown,
        //   ]);
        //   return true;
        // },
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          appBar: const CustomAppBar(
            changeOrientation: true,
            label: 'Цех "Кухня"',
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Количество карточек в ряду
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return ConfirmedOrderWidget(order: orders[index]);
            },
          ),
        ));
  }
}

class Order {
  final String title;
  final String description;
  final String comment;

  Order({
    required this.title,
    required this.description,
    required this.comment,
  });
}
