import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_add_item.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DishCardWidget extends StatelessWidget {
  final Item model;
  final int index;

  const DishCardWidget({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    String formattedPrice;
    if (model.price == model.price.toInt()) {
      formattedPrice = model.price.toInt().toString();
    } else {
      formattedPrice = model.price.toStringAsFixed(2);
    }
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            top: 4,
            right: 4,
          ),
          child: model.image != null
              ? CachedNetworkImage(
                imageUrl: model.image!,
                height: 150,
                //width: 200,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  //можно добавить pre loader image
                  child: SvgPicture.asset(
                    "lib/assets/images/dish_holder_image.svg",
                    height: 150,
                    width: 150,
                  ),
                ),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  "lib/assets/images/dish_holder_image.svg",
                  height: 150,
                  width: 150,
                ),
              )
              : SvgPicture.asset(
                  "lib/assets/images/dish_holder_image.svg",
                  height: 80,
                  width: 80,
                ),
        ),
        Positioned(
          top: 160,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BigText(text: formattedPrice, bold: true),
                    Icon(
                      Icons.currency_ruble,
                      size: 18,
                    ),
                  ],
                ),
                BigText(
                  text: model.title,
                  maxLines: 2,
                ),
                BigText(
                  text: model.weight == 0 || model.weight == null
                      ? "${model.volume} мл"
                      : "${model.weight} г",
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemQuantity = 0;
              if (state.cartModel != null) {
                final cartModel = state.cartModel!;
                final String itemId = model.id.toString();
                if (cartModel.isNotEmpty) {
                  final cartItem = cartModel.where(
                    (item) => item.id == itemId,
                  );
                  if (cartItem.isNotEmpty) {
                    itemQuantity = cartItem.first.quantity;
                  }
                }
              }
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
                child: ButtonAddItem(
                  color: AppColors.lightGreenColor,
                  text: 'Добавить',
                  onPressedLeft: () {
                    context.read<CartBloc>().add(CartEvent.removeFromCartEvent(
                          item: model,
                        ));
                  },
                  onPressedRight: () {
                    context.read<CartBloc>().add(CartEvent.addToCartEvent(
                          item: model,
                        ));
                  },
                  itemQuantity: itemQuantity,
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
