// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as int,
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
      description: json['description'] as String?,
      img: json['img'] as String?,
      address: json['address'] as String?,
      costs: json['costs'] as int?,
      phone: json['phone'] as String?,
      time: json['time'] as String?,
      menu: (json['menu'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'description': instance.description,
      'img': instance.img,
      'address': instance.address,
      'costs': instance.costs,
      'phone': instance.phone,
      'time': instance.time,
      'menu': instance.menu,
    };
