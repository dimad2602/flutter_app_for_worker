import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/pages/cart/confirm_order_page.dart';
import 'package:flutter_app_for_worker/pages/create_order/item_detail_page.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom_app_bar.dart';
import '../../locator_get.dart';
import '../../utils/constants.dart';
import '../../widgets/cart_widgets/items_in_cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Scaffold(
      appBar: CustomAppBar(
        label: "Корзина",
        onTap: () {
          Navigator.of(context).pushNamed('/CreateOrderPage');
        },
        context: context, // Передаем текущий контекст
      ),
      backgroundColor: AppColors.mainColor,
      body: Stack(
        children: [
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return state.cartModel != null && state.cartModel!.isNotEmpty
                ? Positioned(
                    top: sizeConstants.getHeight10(),
                    left: sizeConstants.getWidth10(),
                    right: sizeConstants.getWidth10(),
                    bottom: 0,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          itemCount: state.cartModel!.length,
                          itemBuilder: (_, index) {
                            //print("state.cartModel ${state.cartModel}");
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ItemDetailPage(
                                      itemIncart: state.cartModel![index].item,
                                    ),
                                  ),
                                );
                              },
                              child: ItemsInCartWidget(
                                  itemCount: state.cartModel![index].quantity
                                      .toString(),
                                  index: index,
                                  item: state.cartModel![index].item),
                            );
                          }),
                    ))
                : const Center(child: Text("Ваша корзина пуста!"));

            //buildCompleteUI(context, state.items);
          }),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.cartModel != null && state.cartModel!.isNotEmpty
              ? ButtonBarGreenButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConfirmOrderPage(
                          cartList: state.cartModel!,
                        ),
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
                              Icon(
                                Icons.currency_ruble,
                                size: sizeConstants.getFont10(),
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
                  buttonText: "Перейти к оформлению",
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
