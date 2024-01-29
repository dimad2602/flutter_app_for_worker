
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/pages/first_page/first_page.dart';
import 'package:flutter_app_for_worker/pages/test_count_page.dart';

import 'pages/active_orders_page/active_orders_page.dart';
import 'pages/cart_page.dart/cart_page.dart';
import 'pages/create_order_page/create_order_page.dart';
import 'pages/kitchen_order_page/kitchen_order_page.dart';
import 'pages/new_cart_page/new_cart_page.dart';
import 'pages/profile_page/profile_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (BuildContext context) => const FirstPage(),
  '/ActiveOrdersPage': (BuildContext context) => const ActiveOrdersPage(),
  '/ProfilePage': (BuildContext context) => const ProfilePage(),
  '/CreateOrderPage': (BuildContext context) => const CreateOrderPage(),
  '/CartPage': (BuildContext context) => CartPage(
    //cartRepo: CartRepo(),
    ),
  '/KitchenOrderPage': (BuildContext context) => KitchenOrderPage(),
  '/TestCountPage': (BuildContext context) => const TestCountPage(),
  '/NewCartPage': (BuildContext context) => const NewCartPage(),
  // '/LoginPage': (BuildContext context) => BlocProvider(
  //       create: (context) => LoginBloc(LoginRepository()),
  //       child: LoginPage(),
  //     ),
};
