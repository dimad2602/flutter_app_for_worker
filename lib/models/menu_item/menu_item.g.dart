// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      id: json['id'] as int,
      restId: json['rest_id'] as int,
      itemId: json['item_id'] as int,
      categoryId: json['category_id'] as int,
      item: (json['item'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rest_id': instance.restId,
      'item_id': instance.itemId,
      'category_id': instance.categoryId,
      'item': instance.item,
    };
