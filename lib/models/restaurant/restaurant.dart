import 'package:flutter_app_for_worker/models/brand/brand.dart';
import 'package:flutter_app_for_worker/models/menu/menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required int id,
    required Brand brand,
    String? description,
    String? img,
    String? address,
    int? costs,
    String? phone,
    String? time,
    //Geometry? geometry,
    //List? employees,
    required List<Menu> menu,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
}
