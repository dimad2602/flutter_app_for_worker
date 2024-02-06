import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'items.g.dart';
part 'items.freezed.dart';

@freezed
class Items with _$Items {
  const Items._();

  const factory Items({
    required int id,
    required int restId,
    required int itemId,
    required int categoryId,
    required Item item,
  }) = _Items;

  factory Items.fromJson(Map<String, Object?> json) => _$ItemsFromJson(json);
}
