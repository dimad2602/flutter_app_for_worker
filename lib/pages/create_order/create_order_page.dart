import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/pages/cart/cart_page.dart';
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
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.cartModel.isNotEmpty
              ? ButtonBarGreenButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  row: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BigText(
                            text:
                                "Итого" /*cartController.totalItems.toString() textCountItems*/,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_ruble,
                                size: 16,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  return BigText(
                                    text: context
                                        .read<CartBloc>()
                                        .totalPrice()
                                        .toString(),
                                    bold: true,
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  buttonText: "Корзина",
                  condition: true)
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
