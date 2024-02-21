import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/domain/blocs/order_stream/order_stream_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/order_repo/order_repo.dart';
import 'package:flutter_app_for_worker/pages/active_orders/active_orders_complite_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final idRestaurant = state.maybeWhen(
          authenticated: (user) => user.restaurantId,
          orElse: () => 0,
        );
        return BlocProvider(
          create: (context) => OrderStreamBloc(OrdersRepo())
            ..add(OrderStreamEvent.started(restId: idRestaurant)),
          child: Scaffold(
            body: BlocBuilder<OrderStreamBloc, OrderStreamState>(
              builder: (context, state) {
                return state.when(orders: (ordersList) {
                  return activeOrdersCompliteUI(context, ordersList); //Center(child: Text("complite ${ordersList}"));
                }, loading: () {
                  return circularProgressIndicatorUI();
                }, error: (_) {
                  return errorUI();
                });
              },
            ),
          ),
        );
      },
    );
  }
}

Widget circularProgressIndicatorUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget errorUI() {
  return const Center(
    child: Text("Error", style: TextStyle(color: Colors.black),),
  );
}
