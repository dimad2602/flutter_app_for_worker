import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/pages/active_orders/active_orders_page.dart';
import 'package:flutter_app_for_worker/pages/cart/confirm_order_page.dart';
import 'package:flutter_app_for_worker/pages/create_order/item_detail_page.dart';
import 'package:flutter_app_for_worker/pages/first/first_page.dart';
import 'package:flutter_app_for_worker/pages/list_test/list_test_page.dart';
import 'package:flutter_app_for_worker/pages/sign_in/sign_In_page.dart';
import 'package:flutter_app_for_worker/pages/test_count_page.dart';
import 'package:flutter_app_for_worker/pages/web_socket_test/web_socket_test_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/active_orders/active_orders_old_page.dart';
import 'pages/cart/cart_page.dart';
import 'pages/create_order/create_order_page.dart';
import 'pages/kitchen_order/kitchen_order_page.dart';
import 'pages/new_cart/new_cart_page.dart';
import 'pages/profile/profile_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.maybeMap(
            authenticated: (authenticatedState) {
              return PopScope(
                  canPop: true,
                  onPopInvoked: (didPop) async {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                  },
                  child: const Scaffold(
                      body:
                          FirstPage())); // Здесь отображается контент для аутентифицированного пользователя
            },
            orElse: () {
              return const SignInPage();
            },
          );
        },
      ),
  '/ActiveOrdersOldPage': (BuildContext context) => const ActiveOrdersOldPage(),
  '/ActiveOrdersPage': (BuildContext context) => const ActiveOrdersPage(),
  //'/ActiveOrdersDetailPage': (BuildContext context) => const ActiveOrderDetailPage(order: null,),
  '/ProfilePage': (BuildContext context) => const ProfilePage(),
  '/CreateOrderPage': (BuildContext context) => const CreateOrderPage(),
  '/CartPage': (BuildContext context) => const CartPage(
      //cartRepo: CartRepo(),
      ),
  '/KitchenOrderPage': (BuildContext context) => const KitchenOrderPage(),
  '/TestCountPage': (BuildContext context) => const TestCountPage(),
  '/NewCartPage': (BuildContext context) => const NewCartPage(),
  '/LoginPage': (BuildContext context) => const SignInPage(),
  '/ListTestPage': (BuildContext context) => const LsitTestPage(),
  '/websockettestPage': (BuildContext context) => const WebSocketTestPage(),
};
