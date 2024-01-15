
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/pages/first_page/first_page.dart';

import 'pages/active_orders_page/active_orders_page.dart';
import 'pages/profile_page/profile_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (BuildContext context) => const FirstPage(),
  '/ActiveOrdersPage': (BuildContext context) => const ActiveOrdersPage(),
  '/ProfilePage': (BuildContext context) => const ProfilePage(),
  // '/LoginPage': (BuildContext context) => BlocProvider(
  //       create: (context) => LoginBloc(LoginRepository()),
  //       child: LoginPage(),
  //     ),
};
