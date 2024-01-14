import 'package:flutter_app_for_worker/utils/constants.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Constants>(() => Constants());
}
