import 'package:flutter_app_for_worker/models/brand/brand.dart';
import 'package:flutter_app_for_worker/models/category/category.dart';
import 'package:flutter_app_for_worker/models/geometry/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required int id,
    required Brand brand,
    required String description,
    required String img,
    required String address,
    required int costs,
    required String phone,
    required String time,
    required Geometry geometry,
    List? employees,
    required Category menu,
    //@JsonKey(name: 'email_verified') required bool emailVerified,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
}
