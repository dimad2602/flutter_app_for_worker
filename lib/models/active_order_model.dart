import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_order_model.freezed.dart';

@freezed
class ActiveOrderModel with _$ActiveOrderModel {
  const ActiveOrderModel._();

  const factory ActiveOrderModel({
    required String id,
    required String tableNumber,
    required String time,
    required bool takeaway,
  }) = _ActiveOrderModel;
}
