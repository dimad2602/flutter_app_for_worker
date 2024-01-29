import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/big_text.dart';
import '../../models/item_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Text '),
            const SizedBox(height: 12),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(state.items.toString()),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6750a4),
                      ),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartEvent.removeFromCartEvent(
                                item: state.items.last));
                      },
                      child: const BigText(
                        text: '-',
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class CartPage extends StatelessWidget {
//   //final CartRepo cartRepo;
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       return Scaffold(
//           body: Center(
//         child: Column(
//           children: [
//             const Text('Text '),
//             const SizedBox(height: 12),
//             BlocBuilder<CartBloc, CartState>(
//                   builder: (context, state) {
//                     return Text(state.items.toString());
//                   },
//                 ),
//             BlocBuilder<CartBloc, CartState>(
//               builder: (context, state) {
//                 return ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xff6750a4),
//                               ),
//                               onPressed: () {
//                                 context
//                                     .read<CartBloc>()
//                                     .add(CartEvent.removeFromCartEvent(item: state.items.last));
//                               },
//                               child: const BigText(
//                                 text: '-',
//                                 color: Colors.white,
//                               ),
//                             );
//               },
//             ),
//             // BlocBuilder<CartBloc, CartState>(
//             //   builder: (context, state) {
//             //     return Text(state.items.length.toString());
//             //   },
//             // ),
//             // BlocBuilder<CartBloc, CartState>(
//             //   builder: (context, state) {
//             //     return state.items.isNotEmpty
//             //         ? Expanded(
//             //             child: ListView.builder(
//             //                 itemCount: state.items.length,
//             //                 itemBuilder: (context, index) {
//             //                   return ListTile(
//             //                     title: Text(state.items[index].title),
//             //                     subtitle: Text(
//             //                         '\$${state.items[index].price!.toStringAsFixed(2)}'),
//             //                     trailing: ElevatedButton(
//             //                       onPressed: () {
//             //                         context.read<CartBloc>().add(
//             //                             CartEvent.removeFromCartEvent(
//             //                                 item: state.items[index]));
//             //                       },
//             //                       child: const Text('Удалить'),
//             //                     ),
//             //                   );
//             //                 }))
//             //         : Text('empty');
//             //   },
//             // ),
//           ],
//         ),
//       )
//           // BlocBuilder<CartBloc, CartState>(
//           //   builder: (context, state) {
//           //     return
//           //     state.when(
//           //     //   initial: () {
//           //     //   //context.read<CartBloc>().add(const CartEvent.started());
//           //     //   return circularProgressIndicatorUI();
//           //     // },
//           //     cart: (cartList) {
//           //       print('cartList.length = ${cartList.length}');
//           //       print('state.Items?.length = ${state.Items?.length}');
//           //       return buildCompliteUI(context, cartList, cartRepo);
//           //     });
//           //   },
//           // ),
//           );
//     });
//   }
// }

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildCompliteUI(
    BuildContext context, List<Item>? cart, ICartRepository cartRepo) {
  return Column(
    children: [
      const SizedBox(height: 16),
      Text('Complite $cart'),
      Expanded(
        child: ListView.builder(
          itemCount: cart?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${cart?[index].title}'),
              subtitle: Text('\$${cart?[index].price!.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(CartEvent.removeFromCartEvent(item: cart![index]));
                  // context.read<CartBloc>().add(CartEvent.cartUpdated(
                  //     cartItems: cartRepo.getCartItems())
                  //     );
                },
                child: const Text('Удалить'),
              ),
            );
          },
        ),
      ),
    ],
  );
}
