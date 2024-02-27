import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/app_icon.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/models/cart/cart_model.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatelessWidget {
  final CartModel itemIncart;
  const ItemDetailPage({super.key, required this.itemIncart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: CustomAppBar(
          label: "Заказы",
          rightAppIconFirst: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/CartPage');
                },
                child: Stack(
                  children: [
                    const AppIcon(
                      icon: Icons.shopping_cart_outlined,
                    ),
                    state.cartModel != null && state.cartModel!.isNotEmpty
                        ? const Positioned(
                            right: 0,
                            top: 0,
                            child: AppIcon(
                              icon: Icons.circle,
                              size: 22,
                              iconColor: Colors.transparent,
                              backgroundColor: AppColors.bottonColor,
                            ),
                          )
                        : Container(),
                    state.cartModel != null &&
                            context.read<CartBloc>().totalItemCount() > 0
                        ? Positioned(
                            right: 4,
                            top: 2,
                            child: BigText(
                              text: context
                                  .read<CartBloc>()
                                  .totalItemCount()
                                  .toString(),
                              size: 16,
                              color: Colors.white,
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            },
          )),
      body: const Center(
        child: Text("Data"),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          // var cartModel = state.cartModel!.firstWhere(
          //   (element) => element.id == itemIncart.id,
          //   orElse: () => (null),
          // );
          return ButtonBarGreenButton(
            row: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    final cartModel = state.cartModel!.firstWhere(
                      (element) => element.id == itemIncart.id,
                    );
                    if (cartModel.quantity == 1) {
                      context.read<CartBloc>().add(
                          CartEvent.removeFromCartEvent(item: itemIncart.item));
                      Navigator.of(context).pop();
                    } else {
                      context.read<CartBloc>().add(
                          CartEvent.removeFromCartEvent(item: itemIncart.item));
                    }
                  },
                  child: Icon(
                    state.cartModel!
                                .firstWhere(
                                  (element) => element.id == itemIncart.id,
                                )
                                .quantity ==
                            1
                        ? Icons.close
                        : Icons.remove,
                    color: state.cartModel!
                                .firstWhere(
                                  (element) => element.id == itemIncart.id,
                                )
                                .quantity ==
                            1
                        ? AppColors.redColor
                        : Colors.black45,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                BigText(
                  text: state.cartModel!
                      .firstWhere(
                        (element) => element.id == itemIncart.id,
                      )
                      .quantity
                      .toString(),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CartBloc>()
                        .add(CartEvent.addToCartEvent(item: itemIncart.item));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            buttonText: 'Общая цена | Подтвердить',
            onTap: () {
              // Item.addItem(_itemDetailController.currentItem.value!);
              // //TODO: Вохможно тут нужно использовать Navigate.pup, но тогда есть проблемы с обновлением страници, а сейчас проблема сос скролом
              // //TODO: Переходим только если
              // Get.toNamed(MenuFirePage.routeName);
            },
          );
        },
      ),
    );
  }
}
