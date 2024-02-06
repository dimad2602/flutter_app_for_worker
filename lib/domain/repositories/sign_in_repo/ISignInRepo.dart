import 'package:flutter_app_for_worker/models/restaurant_employee/restaurant_employee.dart';
import 'package:flutter_app_for_worker/models/user/user.dart';

abstract class ISignInRepository {
  Future<RestaurantEmployee?> signInWithEmail({
    required String email,
    required String password,
  });

  Future<RestaurantEmployee?> signInWithSocialNetwork();

  Future<User?> login({required String email, required String password});
}