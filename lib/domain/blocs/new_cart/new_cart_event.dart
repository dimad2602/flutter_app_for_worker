part of 'new_cart_bloc.dart';

@freezed
class NewCartEvent with _$NewCartEvent {
  const factory NewCartEvent.addItem({
    required Item item,
  }) = _AddItem;

  const factory NewCartEvent.removeItem({
    required Item item,
  }) = _RemoveItem;
}