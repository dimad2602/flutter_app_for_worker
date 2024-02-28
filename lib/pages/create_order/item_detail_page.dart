import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/app_icon.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/components/expandeble_text_widget.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/menu_widgets/food_detail_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatelessWidget {
  final Item itemIncart;
  const ItemDetailPage({super.key, required this.itemIncart});

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
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
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: CachedNetworkImage(
              imageUrl: "${itemIncart.image}",
              imageBuilder: (context, imageProvider) => Container(
                width: double.maxFinite,
                height: _screenHeight / 2.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              //Если поставить bottom: 0, то элемент будет на всю длину экрана
              bottom: 0,
              top: _screenHeight / 3,
              child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodDetailtextWidget(
                        item: itemIncart,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const BigText(
                        text: 'Описание',
                        bold: true,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                        text: 'Описание юлюда',
                        screenHeight: MediaQuery.of(context).size.height,
                      ))),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ButtonBarGreenButton(
            row: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    final cartModel = state.cartModel!.firstWhereOrNull(
                      (element) => element.item.id == itemIncart.id,
                    );
                    if (cartModel != null && cartModel.quantity == 1) {
                      context
                          .read<CartBloc>()
                          .add(CartEvent.removeFromCartEvent(item: itemIncart));
                      Navigator.of(context).pop();
                    } else {
                      context
                          .read<CartBloc>()
                          .add(CartEvent.removeFromCartEvent(item: itemIncart));
                    }
                  },
                  child: Icon(
                    state.cartModel!.isNotEmpty
                        ? state.cartModel!
                                    .firstWhereOrNull(
                                      (element) =>
                                          element.item.id == itemIncart.id,
                                    )
                                    ?.quantity ==
                                1
                            ? Icons.close
                            : Icons.remove
                        : Icons.remove,
                    color: state.cartModel!.isNotEmpty
                        ? state.cartModel!
                                    .firstWhereOrNull(
                                      (element) =>
                                          element.item.id == itemIncart.id,
                                    )
                                    ?.quantity ==
                                1
                            ? AppColors.redColor
                            : Colors.black45
                        : Colors.black45,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                BigText(
                  text: state.cartModel!
                          .firstWhereOrNull(
                            (element) => element.item.id == itemIncart.id,
                          )
                          ?.quantity
                          .toString() ??
                      '0',
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CartBloc>()
                        .add(CartEvent.addToCartEvent(item: itemIncart));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            buttonText: '${(state.cartModel!.firstWhereOrNull(
                  (element) => element.item.id == itemIncart.id,
                )?.quantity ?? 0) * (double.parse(state.cartModel!.firstWhereOrNull(
                  (element) => element.item.id == itemIncart.id,
                )?.itemPrice.toString() ?? '0'))} | Закрыть',
            onTap: () {
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
