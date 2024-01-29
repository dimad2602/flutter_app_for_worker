import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/test_count_add/test_count_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/test_count_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/big_text.dart';
import '../models/item_model.dart';

class TestCountPage extends StatelessWidget {
  const TestCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TestCountBloc(TestCountRepo()),
        child: Builder(
          builder: (context) {
            return Scaffold(
                body: Center(
              child: Column(children: [
                const Text('CountPage'),
                const SizedBox(height: 12),
                BlocBuilder<TestCountBloc, TestCountState>(
                  builder: (context, state) {
                    return Text(state.number.toString());
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6750a4),
                  ),
                  onPressed: () {
                    context
                        .read<TestCountBloc>()
                        .add(const TestCountEvent.addCount(index: 1));
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
                        .read<TestCountBloc>()
                        .add(const TestCountEvent.reduceCount(index: 1));
                  },
                  child: const BigText(
                    text: '-',
                    color: Colors.white,
                  ),
                ),
                BlocBuilder<TestCountBloc, TestCountState>(
                  builder: (context, state) {
                    return Text(state.listNumber.toString());
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6750a4),
                  ),
                  onPressed: () {
                    context.read<TestCountBloc>().add(
                        const TestCountEvent.addItem(
                            item: Item(price: 10.99, id: 1, title: 'Пицца')));
                  },
                  child: const BigText(
                    text: 'add item',
                    color: Colors.white,
                  ),
                ),
                BlocBuilder<TestCountBloc, TestCountState>(
                  // buildWhen: (previous, current) {
                  //   print(
                  //       'previous.itemList.length = ${previous.itemList.length}');
                  //   print(
                  //       'current.itemList.length = ${current.itemList.length}');
                  //   return !listEquals(previous.itemList, current.itemList);
                  // },
                  builder: (context, state) {
                    return Text(state.itemList.toString());
                  },
                ),
              ]),
            ));
          },
        ));
  }
}

Widget buildLoadingUI() {
  return const CircularProgressIndicator();
}

Widget buildCompliteUI(BuildContext context, int count) {
  return Center(
    child: Column(
      children: [
        const Text('CountPage'),
        const SizedBox(height: 12),
        Text(count.toString()),
        const SizedBox(height: 12),
        FloatingActionButton(
            child: const Text('+'),
            onPressed: () {
              context
                  .read<TestCountBloc>()
                  .add(const TestCountEvent.addCount(index: 1));
            }),
        const SizedBox(height: 12),
        FloatingActionButton(
            child: const Text('-'),
            onPressed: () {
              context
                  .read<TestCountBloc>()
                  .add(const TestCountEvent.reduceCount(index: 1));
            })
      ],
    ),
  );
}
