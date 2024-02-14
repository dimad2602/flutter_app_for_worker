part of 'order_stream_bloc.dart';

@freezed
class OrderStreamEvent with _$OrderStreamEvent {
  const factory OrderStreamEvent.started({required int restId}) = _Started;
  const factory OrderStreamEvent.dataReceived({required List<Order> ordersList}) = _DataReceived;
}
