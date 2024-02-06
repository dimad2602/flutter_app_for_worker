// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemsImpl _$$ItemsImplFromJson(Map<String, dynamic> json) => _$ItemsImpl(
      id: json['id'] as int,
      restId: json['restId'] as int,
      itemId: json['itemId'] as int,
      categoryId: json['categoryId'] as int,
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemsImplToJson(_$ItemsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restId': instance.restId,
      'itemId': instance.itemId,
      'categoryId': instance.categoryId,
      'item': instance.item,
    };
