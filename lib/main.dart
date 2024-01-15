import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

import 'locator_get.dart';
import 'pages/first_page/first_page.dart';
import 'routes.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Color overlayColor = AppColors.blueAccentColor;
    const systemBarColors = SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.mainColor, //overlayColor,
      statusBarColor: Colors.transparent, //overlayColor,
    );
    SystemChrome.setSystemUIOverlayStyle(systemBarColors);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff007aff)),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Джегло'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FirstPage());
  }
}
