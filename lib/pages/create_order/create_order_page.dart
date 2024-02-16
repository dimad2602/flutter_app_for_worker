import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/pages/create_order/create_order_complite_widget.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blocs/cart/cart_bloc.dart';
import '../../models/cart/cart_model.dart';
import '../../models/item/item.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        // appBar: CustomAppBar(
        //   label: "Создание заказа",
        //   rightAppIconFirst: AppIcon(
        //     icon: Icons.shopping_cart,
        //     iconColor: Colors.black,
        //     backgroundColor: AppColors.mainColorAppbar,
        //     iconSize24: true,
        //     onTap: () {
        //       Navigator.of(context).pushNamed('/CartPage');
        //     },
        //   ),
        // ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.when(cart: (List<Item> items, List<CartModel>? cart) {
              return createOrderCompliteUI(context, state.items);
            });
          },
        ));
  }
}

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}