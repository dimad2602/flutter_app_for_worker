// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  int get id => throw _privateConstructorUsedError;
  Brand get brand => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get img => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get costs => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  Geometry get geometry => throw _privateConstructorUsedError;
  List<dynamic>? get employees => throw _privateConstructorUsedError;
  Category get menu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {int id,
      Brand brand,
      String description,
      String img,
      String address,
      int costs,
      String phone,
      String time,
      Geometry geometry,
      List<dynamic>? employees,
      Category menu});

  $BrandCopyWith<$Res> get brand;
  $GeometryCopyWith<$Res> get geometry;
  $CategoryCopyWith<$Res> get menu;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? description = null,
    Object? img = null,
    Object? address = null,
    Object? costs = null,
    Object? phone = null,
    Object? time = null,
    Object? geometry = null,
    Object? employees = freezed,
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
      employees: freezed == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Category,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res> get brand {
    return $BrandCopyWith<$Res>(_value.brand, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res> get geometry {
    return $GeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get menu {
    return $CategoryCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Brand brand,
      String description,
      String img,
      String address,
      int costs,
      String phone,
      String time,
      Geometry geometry,
      List<dynamic>? employees,
      Category menu});

  @override
  $BrandCopyWith<$Res> get brand;
  @override
  $GeometryCopyWith<$Res> get geometry;
  @override
  $CategoryCopyWith<$Res> get menu;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? description = null,
    Object? img = null,
    Object? address = null,
    Object? costs = null,
    Object? phone = null,
    Object? time = null,
    Object? geometry = null,
    Object? employees = freezed,
    Object? menu = null,
  }) {
    return _then(_$RestaurantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
      employees: freezed == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {required this.id,
      required this.brand,
      required this.description,
      required this.img,
      required this.address,
      required this.costs,
      required this.phone,
      required this.time,
      required this.geometry,
      final List<dynamic>? employees,
      required this.menu})
      : _employees = employees;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final int id;
  @override
  final Brand brand;
  @override
  final String description;
  @override
  final String img;
  @override
  final String address;
  @override
  final int costs;
  @override
  final String phone;
  @override
  final String time;
  @override
  final Geometry geometry;
  final List<dynamic>? _employees;
  @override
  List<dynamic>? get employees {
    final value = _employees;
    if (value == null) return null;
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Category menu;

  @override
  String toString() {
    return 'Restaurant(id: $id, brand: $brand, description: $description, img: $img, address: $address, costs: $costs, phone: $phone, time: $time, geometry: $geometry, employees: $employees, menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      brand,
      description,
      img,
      address,
      costs,
      phone,
      time,
      geometry,
      const DeepCollectionEquality().hash(_employees),
      menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {required final int id,
      required final Brand brand,
      required final String description,
      required final String img,
      required final String address,
      required final int costs,
      required final String phone,
      required final String time,
      required final Geometry geometry,
      final List<dynamic>? employees,
      required final Category menu}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  int get id;
  @override
  Brand get brand;
  @override
  String get description;
  @override
  String get img;
  @override
  String get address;
  @override
  int get costs;
  @override
  String get phone;
  @override
  String get time;
  @override
  Geometry get geometry;
  @override
  List<dynamic>? get employees;
  @override
  Category get menu;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
