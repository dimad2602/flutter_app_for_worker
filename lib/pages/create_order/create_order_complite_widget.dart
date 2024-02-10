import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/domain/blocs/restaurant/restaurant_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/restaurant_repo/restaurant_repo.dart';
import 'package:flutter_app_for_worker/widgets/menu_widgets/dish_card_widet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item/item.dart';

final List<Item> foodMenu = [
  const Item(price: 10.99, id: 1, title: 'Пицца'),
  const Item(price: 8.49, id: 2, title: 'Бургер'),
];

Widget createOrderCompliteUI(
  BuildContext context,
  List<Item> listItems,
) {
  return Builder(builder: (context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              final idRestaurant = state.maybeWhen(
                authenticated: (user) => user.restaurantId,
                orElse: () => 0,
              );
              return BlocProvider(
                create: (context) => RestaurantBloc(RestaurantRepo())
                  ..add(RestaurantEvent.started(idRestaurant)),
                child: BlocBuilder<RestaurantBloc, RestaurantState>(
                  builder: (context, state) {
                    return state.when(initial: () {
                      return const Text('initial');
                    }, loading: () {
                      return const Text('loading');
                    }, error: () {
                      return const Text('error');
                    }, restLoaded: (restaurant) {
                      final menuCategories = restaurant.menu
                          .map((menu) => Tab(text: menu.title))
                          .toList();
                      return
                          DefaultTabController(
                        length: menuCategories.length,
                        child: Column(
                          children: [
                            TabBar(
                              tabs: menuCategories,
                              isScrollable:
                                  true, // Для прокрутки вкладок, если их много
                            ),
                            Expanded(
                              child: TabBarView(
                                children: restaurant.menu.map((menu) {
                                  return GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                      itemCount: menu.items!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 3 / 4,),
                                      itemBuilder: (context, index) {
                                        final items = menu.items![index];
                                        return DishCardWidget(
                                            model: items.item);
                                      });
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                      
                      // return Column(
                      //   children: [
                      //     Expanded(
                      //       child: ListView.builder(
                      //         itemCount: foodMenu.length,
                      //         itemBuilder: (context, index) {
                      //           return BlocBuilder<CartBloc, CartState>(
                      //             builder: (context, state) {
                      //               int itemCount = state.items
                      //                   .where((item) =>
                      //                       item.id == foodMenu[index].id)
                      //                   .length;
                      //               return ListTile(
                      //                 title: Text(foodMenu[index].title),
                      //                 subtitle: Text(
                      //                   '\$${foodMenu[index].price!.toStringAsFixed(2)}',
                      //                 ),
                      //                 trailing: itemCount > 0
                      //                     ? Row(
                      //                         mainAxisSize: MainAxisSize.min,
                      //                         children: [
                      //                           ElevatedButton(
                      //                             onPressed: () {
                      //                               context
                      //                                   .read<CartBloc>()
                      //                                   .add(CartEvent
                      //                                       .removeFromCartEvent(
                      //                                     item: foodMenu[index],
                      //                                   ));
                      //                             },
                      //                             child: const Text('-'),
                      //                           ),
                      //                           Text('$itemCount'),
                      //                           ElevatedButton(
                      //                             onPressed: () {
                      //                               context
                      //                                   .read<CartBloc>()
                      //                                   .add(CartEvent
                      //                                       .addToCartEvent(
                      //                                     item: foodMenu[index],
                      //                                   ));
                      //                             },
                      //                             child: const Text('+'),
                      //                           ),
                      //                         ],
                      //                       )
                      //                     : ElevatedButton(
                      //                         onPressed: () {
                      //                           context.read<CartBloc>().add(
                      //                                 CartEvent.addToCartEvent(
                      //                                   item: foodMenu[index],
                      //                                 ),
                      //                               );
                      //                         },
                      //                         child: const Text('Добавить'),
                      //                       ),
                      //               );
                      //             },
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //     //Text(restaurant.menu.toString()),
                      //     Expanded(
                      //       child: ListView.separated(
                      //           // Позволяем перекрывать категории
                      //           shrinkWrap: true,
                      //           scrollDirection: Axis.vertical,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             try {
                      //               print(
                      //                   "restaurant.menu.length ${restaurant.menu.length}");
                      //               return
                      //                   // Text(
                      //                   //     restaurant.menu[index].items.toString());
                      //                   MenuWidget(
                      //                 menuCategory: restaurant.menu[index].title!,
                      //                 indexCount: index,
                      //                 items: restaurant.menu[index].items!,
                      //               );
                      //             } catch (e) {
                      //               print("Ошибка: $e");
                      //               // Выполните перезагрузку страницы или обновление
                      //               return CircularProgressIndicator(); // Пример заглушки для обновления
                      //             }
                      //           },
                      //           separatorBuilder:
                      //               (BuildContext context, int index) {
                      //             return SizedBox(
                      //               width: sizeConstants.getHeight10(),
                      //             );
                      //           },
                      //           itemCount: restaurant.menu.length
                      //           //_menuPaperController.allCategories.length
                      //           ),
                      //     ),
                      //     BlocBuilder<CartBloc, CartState>(
                      //       builder: (context, state) {
                      //         return Text(state.cartModel.toString());
                      //       },
                      //     ),
                      //   ],
                      // );
                    
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  });
}
