import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';

@freezed
class Item with _$Item{
  const Item._();

  const factory Item({
    required int id,
    required String title,
    String? description,
    int? weight,
    int? volume,
    double? price,
    String? image,
  }) = _Item;
}
