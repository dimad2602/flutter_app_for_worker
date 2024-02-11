import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
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
      appBar: const CustomAppBar(
        label: "Корзина",
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
                            return ItemsInCartWidget(
                                // itemName: state.cartModel![index].itemName,
                                // itemPrice: state.cartModel![index].itemPrice,
                                // itemWeight:
                                //     state.cartModel![index].weight.toString(),
                                itemCount:
                                    state.cartModel![index].quantity.toString(),
                                index: index,
                                item: state.cartModel![index].item);
                          }),
                    ))
                : const Center(child: Text("Ваша корзина пуста!"));

            //buildCompleteUI(context, state.items);
          }),
        ],
      ),
      bottomNavigationBar: ButtonBarGreenButton(
          onTap: () {
            // if (Get.find<AuthController>().userLoggedIn()) {
            //   Get.toNamed(OrderConfirmSql.routeName);
            // } else {
            //   //TODO: Надо запомнить с какой страницы мы попали на авторизацию, после автозицации вернуть на предыдущую страницу
            //   Get.toNamed(LoginPageSQL.routeName);
            // }
          },
          row: Row(
            children: [
              Column(
                children: [
                  BigText(
                    text:
                        "Итого" /*cartController.totalItems.toString() textCountItems*/,
                    size: sizeConstants.getFont10(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_ruble,
                        size: sizeConstants.getFont10(),
                      ),
                      BigText(
                        text: "Total price",
                        bold: true,
                        size: sizeConstants.getFont10(),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: sizeConstants.getWidth10() / 2,
              ),
            ],
          ),
          buttonText: "Перейти к оформлению",
          condition: true), //Если items > 0
    );
  }
}

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

// Widget buildCompleteUI(BuildContext context, List<Item>? cart) {
//   return Column(
//     children: [
//       const SizedBox(height: 16),
//       Text('Complite ${cart?.length}'),
//       Expanded(
//         child: ListView.builder(
//           itemCount: cart?.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text('${cart?[index].title}'),
//               subtitle: Text('\$${cart?[index].price.toStringAsFixed(2)}'),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<CartBloc>().add(
//                           CartEvent.removeFromCartEvent(item: cart![index]));
//                     },
//                     child: const Text('-'),
//                   ),
//                   const Text('123'),
//                   //Text('${cartRepo.getItemsCart()[index]?.quantity}'),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Добавьте сюда обработчик для кнопки "+"
//                       context.read<CartBloc>().add(
//                           CartEvent.addToCartEvent(item: cart![index]));
//                     },
//                     child: const Text('+'),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     ],
//   );
// }


// Widget buildCompliteUI(
//     BuildContext context, List<Item>? cart, ICartRepository cartRepo) {
//   return Column(
//     children: [
//       const SizedBox(height: 16),
//       Text('Complite $cart'),
//       Expanded(
//         child: ListView.builder(
//           itemCount: cart?.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text('${cart?[index].title}'),
//               subtitle: Text('\$${cart?[index].price!.toStringAsFixed(2)}'),
//               trailing: ElevatedButton(
//                 onPressed: () {
//                   context
//                       .read<CartBloc>()
//                       .add(CartEvent.removeFromCartEvent(item: cart![index]));
//                   // context.read<CartBloc>().add(CartEvent.cartUpdated(
//                   //     cartItems: cartRepo.getCartItems())
//                   //     );
//                 },
//                 child: const Text('Удалить'),
//               ),
//             );
//           },
//         ),
//       ),
//     ],
//   );
// }
