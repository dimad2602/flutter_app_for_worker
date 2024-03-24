import 'package:flutter_app_for_worker/models/items/items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.g.dart';
part 'order.freezed.dart';

@freezed
class Order with _$Order{
  const Order._();

  const factory Order({
    required int id,
    // required int uid,
    // required int restid,
    required String status,
    @JsonKey(name: 'created_at')
    required String createdAt,
    @JsonKey(name: 'completed_at')
    String? completedAt,
    List<Items>? items,
    //String? note, // TODO У ордера может бить общее поле note (не только у items)
  }) = _Order;

  //Должно приходить = 
  //     "id": 0,
  //     "uid": 0,
  //     "restid": 0,
  //     "status": "string",
  //     "created_at": "2024-02-11T09:16:51.038Z",
  //     "completed_at": "2024-02-11T09:16:51.038Z",
  //     "items": [
  //       {}

    factory Order.fromJson(Map<String, Object?> json)
      => _$OrderFromJson(json);
}


