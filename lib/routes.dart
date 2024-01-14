
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/pages/first_page/first_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (BuildContext context) => const FirstPage(),
  //'/CalculatorPage': (BuildContext context) => const CalculatorPage(),
  // '/LoginPage': (BuildContext context) => BlocProvider(
  //       create: (context) => LoginBloc(LoginRepository()),
  //       child: LoginPage(),
  //     ),
};
