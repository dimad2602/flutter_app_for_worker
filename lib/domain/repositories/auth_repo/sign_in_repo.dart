import 'package:flutter_app_for_worker/domain/api/api_provider.dart';
import 'package:flutter_app_for_worker/domain/repositories/auth_repo/ISignInRepo.dart';
import 'package:flutter_app_for_worker/models/restaurant_employee/restaurant_employee.dart';

class SignInRepo implements ISignInRepository {
  late final ApiProvider apiProvider;
  @override
  Future<RestaurantEmployee?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'example@sample.com' && password == 'password') {
      return RestaurantEmployee(email: email, name: 'Дмитрий');
    } else {
      return null;
    }
  }

  Future<http.Response> login(String email, String password) async {
    return await apiProvider.postData(
        AppConstants.AUTH_LOGIN_URI, {"login": email, "passwd": password});
  }

  @override
  Future<RestaurantEmployee?> signInWithSocialNetwork() async {
    await Future.delayed(const Duration(seconds: 2));

    return const RestaurantEmployee(
        email: 'social@example.com', name: 'Social User');
  }
}
