import 'package:flutter/material.dart';
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
      body: Center(
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
                Navigator.of(context).pushNamed('/ListSearchPage');
              },
              child: const BigText(
                text: "3",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
