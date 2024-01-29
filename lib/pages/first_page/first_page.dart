import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/locator_get.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/utils/constants.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    //var sizeConstants = locator.get<Constants>();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Джегло'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/ActiveOrdersPage');
                },
                child: const BigText(
                  text: "ActiveOrdersPage (Полученные нереализованные заказы)",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/ProfilePage');
                },
                child: const BigText(
                  text: "Профиль",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/CreateOrderPage');
                },
                child: const BigText(
                  text:
                      "Страница создания заказа(создают официанты для клиентов сами, через приложение, оплата постаринке как до приложения )",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () {
              
                },
                child: const BigText(
                  text: "Взять перерыв",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () {
                
                },
                child: const BigText(
                  text: "Начать рабочий день",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () {
                  
                },
                child: const BigText(
                  text: "Закончить рабочий день",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () async {
                  await SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ]);
      
                  Navigator.of(context).pushNamed('/KitchenOrderPage');
                },
                child: const BigText(
                  text: "Заказ на кухне (удобная информация)",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () async {
                  Navigator.of(context).pushNamed('/TestCountPage');
                },
                child: const BigText(
                  text: "Счетчик test",
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750a4),
                ),
                onPressed: () async {
                  Navigator.of(context).pushNamed('/NewCartPage');
                },
                child: const BigText(
                  text: "New Cart",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
