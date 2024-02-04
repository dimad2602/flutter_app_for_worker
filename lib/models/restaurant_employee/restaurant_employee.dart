import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_employee.freezed.dart';
part 'restaurant_employee.g.dart';

@freezed
class RestaurantEmployee with _$RestaurantEmployee{
  const factory RestaurantEmployee({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    required String passwd,
    //required String created_at,
    //required String udated_at,
    //required List<Order> orders,
    //required RestaurantEmployee works,
  }) = _RestaurantEmployee;

  factory RestaurantEmployee.fromJson(Map<String, Object?> json)
      => _$RestaurantEmployeeFromJson(json);
}