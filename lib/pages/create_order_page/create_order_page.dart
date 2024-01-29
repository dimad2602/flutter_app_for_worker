import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/domain/repositories/cart_repo.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../domain/blocs/cart/cart_bloc.dart';
import '../../models/item_model.dart';

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
                cart: (List<Item> items) {
              return buildCompliteUI(context, state.items);
            });
            // if (state is CartUpdatedState) {
            //   return ListView.builder(
            //     itemCount: foodMenu.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(foodMenu[index].name),
            //         subtitle: Text('\$${foodMenu[index].price.toStringAsFixed(2)}'),
            //         trailing: ElevatedButton(
            //           onPressed: () {
            //             context
            //                 .read<FoodBloc>()
            //                 .add(AddToCartEvent(food: foodMenu[index]));
            //           },
            //           child: Text('Добавить в корзину'),
            //         ),
            //       );
            //     },
            //   );
            // } else {
            //   return CircularProgressIndicator();
            // }
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
            return Text(state.items.toString());
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6750a4),
              ),
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(CartEvent.removeFromCartEvent(item: state.items.last));
              },
              child: const BigText(
                text: '-',
                color: Colors.white,
              ),
            );
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: foodMenu.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(foodMenu[index].title),
                subtitle:
                    Text('\$${foodMenu[index].price!.toStringAsFixed(2)}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartEvent.addToCartEvent(item: foodMenu[index]));
                  },
                  child: Text('Добавить в корзину'),
                ),
              );
            },
          ),
        ),
      ],
    );
  });
}
