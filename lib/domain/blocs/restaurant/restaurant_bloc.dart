import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/restaurant_repo/iRestautantRepo.dart';
import 'package:flutter_app_for_worker/models/restaurant/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';
part 'restaurant_bloc.freezed.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final IRestaurantRepo _repository;
  RestaurantBloc(this._repository) : super(const RestaurantState.initial()) {
    on<RestaurantEvent>((event, emit) async {
      await event.map(
        started: (value) => _started(value, emit),
      );
    });
  }

  FutureOr<void> _started(_Started value, Emitter<RestaurantState> emit) async {
    print('_started');
    if (value.idRestaurant == 0) {
      emit(const RestaurantState.error());
    }
    emit(const RestaurantState.loading());
    await Future.delayed(const Duration(seconds: 1));
    final response = await _repository.getRestaurantById(id: value.idRestaurant);
    print('_started response = ${response}');
    final rest = _repository.getRestaurant();

    print('rest');
     print(rest.id);
    print(rest.toString());
    print(rest.toJson());
    if (rest == null) {
      emit(const RestaurantState.error());
    } else {
      emit(RestaurantState.restLoaded(restaurant: rest));
    }
  }
}
