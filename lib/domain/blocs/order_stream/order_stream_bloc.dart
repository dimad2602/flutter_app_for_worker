import 'dart:async';
import 'package:flutter_app_for_worker/domain/repositories/order_repo/IOrderRepo.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_stream_event.dart';
part 'order_stream_state.dart';
part 'order_stream_bloc.freezed.dart';

class OrderStreamBloc extends Bloc<OrderStreamEvent, OrderStreamState> {
  final IOrderRepo _repository;
  StreamSubscription<List<Order>>? _ordersSubscription;

  OrderStreamBloc(this._repository)
      : super(const OrderStreamState.orders(orderList: [])) {
    on<OrderStreamEvent>((event, emit) async {
      await event.map(
          started: (_) => _started(_, emit),
          dataReceived: (_) => _dataReceived(_, emit));
    });
  }

  FutureOr<void> _started(
      _Started _started, Emitter<OrderStreamState> emit) async {
    //функция вызываеться каждый раз когда приходят новые данные
    _ordersSubscription?.cancel();
    // _ordersSubscription = _repository.genStream(1).listen((list) {
    //   add(OrderStreamEvent.dataReceived(ordersList: list));
    // });
    _ordersSubscription = _repository.ordersStream.listen((list) {
      add(OrderStreamEvent.dataReceived(ordersList: list));
    });
    
    // emit(const OrderStreamState.loading());
    // try {
    //   final orderList = await _repository.fetchOrders(id: _started.restId);
    //   emit(OrderStreamState.orders(orderList: orderList));
    // } catch (e) {
    //   emit(OrderStreamState.error(message: e.toString()));
    // }
  }

  FutureOr<void> _dataReceived(
      _DataReceived event, Emitter<OrderStreamState> emit) {
    emit(OrderStreamState.orders(orderList: event.ordersList));
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
