import 'dart:async';
import 'dart:convert';

import 'package:flutter_app_for_worker/domain/api/api_provider.dart';
import 'package:flutter_app_for_worker/domain/repositories/restaurant_repo/iRestautantRepo.dart';
import 'package:flutter_app_for_worker/locator_get.dart';
import 'package:flutter_app_for_worker/models/restaurant/restaurant.dart';
import 'package:http/http.dart';

class RestaurantRepo implements IRestaurantRepo {
  late Restaurant restaurant;
  final ApiProvider apiProvider = locator.get<ApiProvider>();

  @override
  Restaurant getRestaurant() {
    return restaurant;
  }

  @override
  Future<Response> getRestaurantById({required int id}) async {
    print('getRestaurantById start');
    try {
      var token = apiProvider
          .token; //sharedPreferences.getString(AppConstants.TOKEN)??"";

      final response = await apiProvider.getData(
          "http://10.0.2.2:3000/restaurants/$id",
          headers: {"Authorization": "Bearer $token"});

      print('response ${response.statusCode}');
      print('response ${response.body}');
      if (response.statusCode == 200) {
        print('response restaurant');
        try {
          restaurant = Restaurant.fromJson(json.decode(response.body));
        } catch (e) {
          print('response restaurant error $e');
          print('response restaurant error ${e.toString()}');
          rethrow;
        }
      }
      return await apiProvider.getData("http://10.0.2.2:3000/restaurants/$id",
          headers: {"Authorization": "Bearer $token"});
    } catch (e) {
      print('getRestaurantById error');
      rethrow;
    }
  }
}
