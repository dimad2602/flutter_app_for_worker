import 'package:flutter_app_for_worker/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required int id,
    @JsonKey(name: 'rest_id') required int restId,
    @JsonKey(name: 'item_id') required int itemId,
    @JsonKey(name: 'category_id') required int categoryId,
    required List<Item> item,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, Object?> json) =>
      _$MenuItemFromJson(json);
}