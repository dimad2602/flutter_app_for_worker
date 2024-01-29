import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../domain/blocs/cart/cart_bloc.dart';
import '../../models/cart/cart_model.dart';
import '../../models/item/item_model.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: CustomAppBar(
          label: "Создание заказа",
          rightAppIconFirst: AppIcon(
            icon: Icons.shopping_cart,
            iconColor: Colors.black,
            backgroundColor: AppColors.mainColorAppbar,
            iconSize24: true,
            onTap: () {
              Navigator.of(context).pushNamed('/CartPage');
            },
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.when(
                //   initial: () {
                //   context.read<CartBloc>().add(const CartEvent.started());
                //   return circularProgressIndicatorUI();
                // },
                cart: (List<Item> items, List<CartModel>? cart) {
              return buildCompliteUI(context, state.items);
            });
          },
        ));
  }
}

final List<Item> foodMenu = [
  const Item(price: 10.99, id: 1, title: 'Пицца'),
  const Item(price: 8.49, id: 2, title: 'Бургер'),
  // Добавьте другие блюда по мере необходимости
];

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildCompliteUI(
  BuildContext context,
  List<Item> listItems,
) {
  return Builder(builder: (context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(state.cartModel.toString());
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: foodMenu.length,
            itemBuilder: (context, index) {
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  int itemCount = state.items
                      .where((item) => item.id == foodMenu[index].id)
                      .length;
                  return ListTile(
                    title: Text(foodMenu[index].title),
                    subtitle:
                        Text('\$${foodMenu[index].price!.toStringAsFixed(2)}'),
                    trailing: itemCount > 0
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                      CartEvent.removeFromCartEvent(
                                          item: foodMenu[index]));
                                  // context.read<CartBloc>().add(
                                  //     CartEvent.removeFromCartModelEvent(
                                  //         itemId: foodMenu[index].id));
                                },
                                child: const Text('-'),
                              ),
                              Text('$itemCount'),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                      CartEvent.addToCartEvent(
                                          item: foodMenu[index]));
                                },
                                child: const Text('+'),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                  CartEvent.addToCartEvent(
                                      item: foodMenu[index]));
                            },
                            child: const Text('Добавить'),
                          ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  });
}
