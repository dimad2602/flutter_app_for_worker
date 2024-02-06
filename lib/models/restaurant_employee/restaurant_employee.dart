import 'package:flutter_app_for_worker/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_employee.freezed.dart';
part 'restaurant_employee.g.dart';

@freezed
class RestaurantEmployee with _$RestaurantEmployee{
  const factory RestaurantEmployee({
    required int id,
    @JsonKey(name: 'employee_id')required int employeeId,
    //required User user,
    @JsonKey(name: 'restaurant_id')required int restaurantId,
    required String email,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'email_verified') required bool emailVerified,
    required String passwd,
  }) = _RestaurantEmployee;

  factory RestaurantEmployee.fromJson(Map<String, Object?> json)
      => _$RestaurantEmployeeFromJson(json);
}