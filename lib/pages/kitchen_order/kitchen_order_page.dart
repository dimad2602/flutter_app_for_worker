import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/domain/blocs/order_stream/order_stream_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/order_repo/order_repo.dart';
import 'package:flutter_app_for_worker/pages/kitchen_order/kitchen_order_complite_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// final List<Order> orders = [
//   const Order(id: 0, status: 'Готов', createdAt: '2024-02-11 15:58:05.825456'),
//   const Order(
//       id: 1, status: 'В процессе', createdAt: '2024-02-11 15:58:05.825456'),
//   const Order(
//       id: 2, status: 'Задерживаеться', createdAt: '2024-02-11 15:58:05.825456'),
//   const Order(
//       id: 3, status: 'Поступил', createdAt: '2024-02-11 15:58:05.825456'),
//   const Order(
//       id: 4, status: 'Поступил', createdAt: '2024-02-11 15:58:05.825456'),
// ];

// final List<Item> items1 = [
//   const Item(id: 0, title: 'Блюдо 0', price: 1123),
//   const Item(id: 1, title: 'Блюдо 1', price: 23),
//   const Item(id: 5, title: 'Блюдо 5', price: 123),
//   const Item(id: 2, title: 'Блюдо 2', price: 240),
// ];

// final List<Item> items2 = [
//   const Item(id: 0, title: 'Блюдо 0', price: 1123),
//   const Item(id: 1, title: 'Блюдо 1', price: 23),
// ];

// final List<Item> items3 = [
//   const Item(id: 0, title: 'Блюдо 0', price: 1123),
//   const Item(id: 1, title: 'Блюдо 1', price: 23),
//   const Item(id: 2, title: 'Блюдо 0', price: 1123),
//   const Item(id: 3, title: 'Блюдо 1', price: 23),
//   const Item(id: 4, title: 'Блюдо 5', price: 123),
//   const Item(id: 5, title: 'Блюдо 2', price: 240),
//   const Item(id: 6, title: 'Блюдо 0', price: 1123),
//   const Item(id: 7, title: 'Блюдо 1', price: 23),
//   const Item(id: 8, title: 'Блюдо 5', price: 123),
//   const Item(id: 9, title: 'Блюдо 2', price: 240),
// ];

class KitchenOrderPage extends StatelessWidget {
  const KitchenOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final idRestaurant = state.maybeWhen(
          authenticated: (user) => user.restaurantId,
          orElse: () => 0,
        );
        return BlocProvider(
          create: (context) => OrderStreamBloc(OrdersRepo())
            ..add(OrderStreamEvent.started(restId: idRestaurant)),
          child: Scaffold(
            body: BlocBuilder<OrderStreamBloc, OrderStreamState>(
              builder: (context, state) {
                return state.when(orders: (ordersList) {
                  return kitchenOrderCompliteUI(context,
                      ordersList); //activeOrdersCompliteUI(context, ordersList);
                }, loading: () {
                  return circularProgressIndicatorUI();
                }, error: (_) {
                  return errorUI();
                });
              },
            ),
          ),
        );
      },
    );
  }
}

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget errorUI() {
  return const Center(
    child: Text(
      "Error",
      style: TextStyle(color: Colors.black),
    ),
  );
}

// class KitchenOrderPage extends StatelessWidget {
//   final List<Order> orders;
//   const KitchenOrderPage({super.key, required this.orders});

//   @override
//   Widget build(BuildContext context) {
//     double _screenWidth = MediaQuery.of(context).size.width;
//     return PopScope(
//         onPopInvoked: (didPop) async {
//           SystemChrome.setPreferredOrientations([
//             DeviceOrientation.portraitUp,
//             DeviceOrientation.portraitDown,
//           ]);
//         },
//         child: Scaffold(
//           backgroundColor: AppColors.mainColor,
//           appBar: const CustomAppBar(
//             changeOrientation: true,
//             label: 'Цех "Кухня"',
//           ),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 12.0),
//                     child: SizedBox(
//                       width: _screenWidth * 0.32,
//                       child: Row(
//                         children: [
//                           //TextButton(onPressed: onPressed, child: child)
//                           Expanded(
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   color: AppColors.lightGreenColor,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       color: Colors.black,
//                                       Icons.remove_red_eye_rounded,
//                                       size: 24,
//                                     ),
//                                     SizedBox(
//                                       width: 8,
//                                     ),
//                                     BigText(
//                                       text: "Готовые",
//                                       bold: true,
//                                       color: Colors.white,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 16,
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   color: AppColors.lightGreenColor,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       color: Colors.black,
//                                       Icons.import_contacts,
//                                       size: 24,
//                                     ),
//                                     SizedBox(
//                                       width: 8,
//                                     ),
//                                     BigText(
//                                       text: "Архив",
//                                       bold: true,
//                                       color: Colors.white,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 50.0, left: 16),
//                   child: ListView.builder(
//                     controller: ScrollController(), //TODO: А оно точно нужно???
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     physics: const ClampingScrollPhysics(),
//                     itemBuilder: (BuildContext context, int index) {
//                       return Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           OrdersInKitchen(
//                             order: orders[index],
//                           ),
//                           const SizedBox(
//                             width: 16,
//                           )
//                         ],
//                       );
//                     },
//                     itemCount: 4,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
