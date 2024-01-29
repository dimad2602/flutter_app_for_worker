import 'package:freezed_annotation/freezed_annotation.dart';

import '../item/item_model.dart';

part 'cart_model.g.dart';
part 'cart_model.freezed.dart';

@freezed
class CartModel with _$CartModel {
  const CartModel._();

  const factory CartModel({
    required String id,
    required String itemName,
    required String itemPrice,
    String? description,
    int? weight,
    int? volume,
    String? imagePath,
    required int quantity,
    String? time,
    String? restaurantId,
    required Item item,
  }) = _CartModel;


  factory CartModel.fromJson(Map<String, Object?> json)
      => _$CartModelFromJson(json);
}
