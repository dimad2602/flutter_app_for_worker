import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/domain/blocs/restaurant/restaurant_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/restaurant_repo/restaurant_repo.dart';
import 'package:flutter_app_for_worker/pages/list_test/dish_test_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item/item.dart';

final List<Item> foodMenu = [
  const Item(price: 10.99, id: 1, title: 'Пицца'),
  const Item(price: 8.49, id: 2, title: 'Бургер'),
];

Widget ListComplitePage(
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
                                        return DishTestWidget(
                                            model: items.item);
                                      });
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                      
                    });
                  },
                ),
              );
            },
          ),
        ),
        ButtonBarGreenButton(buttonText: 'Text',),
        Container(
          color: Colors.white,
         height: 40, width: 80, child: Text("Auuu"),)
      ],
    );
  });
}
