import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.of(context).pushNamed('/CalculatorPage');
              },
              child: const BigText(
                text: "Калькулятор",
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6750a4),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/LoginPage');
              },
              child: const BigText(
                text: "LoginPage",
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
                text: "ListSearchPage",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
