import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/models/cart/cart_model.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/pages/list_test/list_complite_page.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LsitTestPage extends StatelessWidget {
  const LsitTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
        appBar: AppBar(),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.when(cart: (List<Item> items, List<CartModel>? cart) {
              return ListComplitePage(context, state.items);
            });
          },
        ));
    // Column(
    //   children: [
    //      Expanded(
    //       child: ListView.builder(
    //         itemCount:5,
    //         itemBuilder: (context, index) {
    //           return Text(index.toString());
    //         },
    //       ),
    //     ),
    //     Text('dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'),
    //     Expanded(
    //       child: ListView.builder(
    //         itemCount:100,
    //         itemBuilder: (context, index) {
    //           return Text(index.toString());
    //         },
    //       ),
    //     ),
    //   ],
    // ),
    //);
  }
}
