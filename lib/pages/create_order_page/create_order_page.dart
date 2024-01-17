import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/domain/blocs/bloc/cart_bloc.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_icon.dart';
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
            return state.when(initial: () {
              BlocProvider.of<CartBloc>(context).add(const CartEvent.started());
              return CircularProgressIndicatorUI();
            }, cart: (List<Item> items) {
              return buildCompliteUI(context, state.Items!);
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

Widget CircularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildCompliteUI(
  BuildContext context,
  List<Item> listItems,
) {
  return Column(
    children: [
      const SizedBox(height: 16),
      Expanded(
        child: ListView.builder(
          itemCount: foodMenu.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(foodMenu[index].title),
              subtitle: Text('\$${foodMenu[index].price!.toStringAsFixed(2)}'),
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
}
