import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/kitchen_orders_widgets/orders_in_kitchen_widget.dart';

import '../../components/custom_app_bar.dart';

final List<Order> orders = [
  const Order(id: 0, status: 'Готов'),
  const Order(id: 1, status: 'В процессе'),
  const Order(id: 2, status: 'Задерживаеться'),
  const Order(id: 3, status: 'Поступил'),
  const Order(id: 4, status: 'Поступил'),
];

final List<Item> items1 = [
  const Item(id: 0, title: 'Блюдо 0', price: 1123),
  const Item(id: 1, title: 'Блюдо 1', price: 23),
  const Item(id: 5, title: 'Блюдо 5', price: 123),
  const Item(id: 2, title: 'Блюдо 2', price: 240),
];

final List<Item> items2 = [
  const Item(id: 0, title: 'Блюдо 0', price: 1123),
  const Item(id: 1, title: 'Блюдо 1', price: 23),
];

final List<Item> items3 = [
  const Item(id: 0, title: 'Блюдо 0', price: 1123),
  const Item(id: 1, title: 'Блюдо 1', price: 23),
  const Item(id: 2, title: 'Блюдо 0', price: 1123),
  const Item(id: 3, title: 'Блюдо 1', price: 23),
  const Item(id: 4, title: 'Блюдо 5', price: 123),
  const Item(id: 5, title: 'Блюдо 2', price: 240),
  const Item(id: 6, title: 'Блюдо 0', price: 1123),
  const Item(id: 7, title: 'Блюдо 1', price: 23),
  const Item(id: 8, title: 'Блюдо 5', price: 123),
  const Item(id: 9, title: 'Блюдо 2', price: 240),
];

class KitchenOrderPage extends StatelessWidget {
  const KitchenOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SizedBox(
                      width: _screenWidth * 0.32,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.lightGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      color: Colors.black,
                                      Icons.remove_red_eye_rounded,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    BigText(text: "Готовые", bold: true),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.lightGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      color: Colors.black,
                                      Icons.import_contacts,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    BigText(text: "Архив", bold: true),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrdersInKitchen(
                            order: orders[index],
                            items: index == 0
                                ? items1
                                : index == 1
                                    ? items2
                                    : index == 2
                                        ? items3
                                        : items1,
                          ),
                          const SizedBox(
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
