// ignore_for_file: invalid_annotation_target

import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required int id,
    String? title,
    required int restId, //@JsonKey(name: 'rest_id')
    List<Item>? items,
  }) = _Menu;

  factory Menu.fromJson(Map<String, Object?> json) =>
      _$MenuFromJson(json);
}