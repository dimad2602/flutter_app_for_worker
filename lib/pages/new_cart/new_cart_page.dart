import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/new_cart/new_cart_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/new_cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/big_text.dart';
import '../../models/item/item.dart';

class NewCartPage extends StatelessWidget {
  const NewCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewCartBloc(NewCartRepo()),
        child: Builder(
          builder: (context) {
            return Scaffold(
                body: Center(
              child: Column(children: [
                const Text('CountPage'),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6750a4),
                  ),
                  onPressed: () {
                    context
                        .read<NewCartBloc>()
                        .add(const NewCartEvent.addItem(item: Item(price: 10.99, id: 1, title: 'Пицца')));
                  },
                  child: const BigText(
                    text: '+',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6750a4),
                  ),
                  onPressed: () {
                    context
                        .read<NewCartBloc>()
                        .add(const NewCartEvent.removeItem(item: Item(price: 10.99, id: 1, title: 'Пицца')));
                  },
                  child: const BigText(
                    text: '-',
                    color: Colors.white,
                  ),
                ),
                 BlocBuilder<NewCartBloc, NewCartState>(
                  builder: (context, state) {
                    return Text(state.cartList.toString());
                  },
                ),
              ]),
            ));
          },
        ));
  }
}