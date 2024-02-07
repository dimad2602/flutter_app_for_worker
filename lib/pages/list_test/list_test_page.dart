import 'package:flutter/material.dart';

class LsitTestPage extends StatelessWidget {
  const LsitTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
           Expanded(
            child: ListView.builder(
              itemCount:5,
              itemBuilder: (context, index) {
                return Text(index.toString());
              },
            ),
          ),
          Text('dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'),
          Expanded(
            child: ListView.builder(
              itemCount:100,
              itemBuilder: (context, index) {
                return Text(index.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
