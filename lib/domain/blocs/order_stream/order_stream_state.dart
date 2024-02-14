part of 'order_stream_bloc.dart';

@freezed
class OrderStreamState with _$OrderStreamState {
  const factory OrderStreamState.orders({required List<Order> orderList}) = _Orders;
  const factory OrderStreamState.loading() = _Loading;
  const factory OrderStreamState.error({required String message}) = _Error;
}
