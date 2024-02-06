import 'package:flutter_app_for_worker/models/restaurant/restaurant.dart';
import 'package:http/http.dart';

abstract class IRestaurantRepo {
  //late Restaurant restaurant;
  Restaurant getRestaurant();

  Future<Response> getRestaurantById({required int id});
}
