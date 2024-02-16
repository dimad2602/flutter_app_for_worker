import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/kitchen_orders_widgets/orders_in_kitchen_widget.dart';

import '../../components/custom_app_bar.dart';

class KitchenOrderPage extends StatelessWidget {
  const KitchenOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (didPop) async {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        },
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          appBar: const CustomAppBar(
            changeOrientation: true,
            label: 'Цех "Кухня"',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: AppColors.lightGreenColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const BigText(text: "Готовые"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: AppColors.lightGreenColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const BigText(text: "Архив"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0, left: 16),
                  child: ListView.builder(
                    controller: ScrollController(), //TODO: А оно точно нужно???
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrdersInKitchen(order: Order(id: 1, status: "Поступил"),),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      );
                    },
                    itemCount: 4,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app_for_worker/utils/app_colors.dart';

// import '../../components/custom_app_bar.dart';
// import '../../widgets/orders_widgets/confirmed_orders_widget.dart';

// class KitchenOrderPage extends StatelessWidget {
//   const KitchenOrderPage({super.key});

//   // final List<Order> orders = [
//   //   Order(
//   //     title: "Заказ #1",
//   //     description: "Пицца, напиток",
//   //     comment: "Без острых приправ",
//   //   ),
//   //   Order(
//   //     title: "Заказ #2",
//   //     description: "Бургер, картошка фри",
//   //     comment: "Доставить к 18:00",
//   //   ),
//   //   Order(
//   //     title: "Заказ #3",
//   //     description: "Бургер, картошка фри",
//   //     comment: "Доставить к 18:00",
//   //   ),
//   //   Order(
//   //     title: "Заказ #4",
//   //     description: "Бургер, картошка фри",
//   //     comment: "Доставить к 18:00",
//   //   ),
//   //   Order(
//   //     title: "Заказ #5",
//   //     description: "Бургер, картошка фри",
//   //     comment: "Доставить к 18:00",
//   //   ),
//   //   // Добавьте другие заказы по мере необходимости
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//         onPopInvoked: (didPop) async {
//           SystemChrome.setPreferredOrientations([
//             DeviceOrientation.portraitUp,
//             DeviceOrientation.portraitDown,
//           ]);
//         },
//         // onWillPop: () async {
//         //   SystemChrome.setPreferredOrientations([
//         //     DeviceOrientation.portraitUp,
//         //     DeviceOrientation.portraitDown,
//         //   ]);
//         //   return true;
//         // },
//         child: Scaffold(
//           backgroundColor: AppColors.mainColor,
//           appBar: const CustomAppBar(
//             changeOrientation: true,
//             label: 'Цех "Кухня"',
//           ),
//           body: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, //Количество карточек в ряду
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//             ),
//             itemCount: 5, //orders.length,
//             itemBuilder: (context, index) {
//               return Text("dfg"); //ConfirmedOrderWidget(order: orders[index]);
//             },
//           ),
//         ));
//   }
// }

// // class Order {
// //   final String title;
// //   final String description;
// //   final String comment;

// //   Order({
// //     required this.title,
// //     required this.description,
// //     required this.comment,
// //   });
// // }
