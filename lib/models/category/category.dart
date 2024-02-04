import 'package:flutter_app_for_worker/models/menu_item/menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String title,
    required int restId,
    required List<MenuItem> items,
    List? rest,
    //@JsonKey(name: 'email_verified') required bool emailVerified,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
