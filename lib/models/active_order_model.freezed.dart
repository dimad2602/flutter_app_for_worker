// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActiveOrderModel {
  String get id => throw _privateConstructorUsedError;
  String get tableNumber => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  bool get takeaway => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActiveOrderModelCopyWith<ActiveOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveOrderModelCopyWith<$Res> {
  factory $ActiveOrderModelCopyWith(
          ActiveOrderModel value, $Res Function(ActiveOrderModel) then) =
      _$ActiveOrderModelCopyWithImpl<$Res, ActiveOrderModel>;
  @useResult
  $Res call({String id, String tableNumber, String time, bool takeaway});
}

/// @nodoc
class _$ActiveOrderModelCopyWithImpl<$Res, $Val extends ActiveOrderModel>
    implements $ActiveOrderModelCopyWith<$Res> {
  _$ActiveOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableNumber = null,
    Object? time = null,
    Object? takeaway = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      takeaway: null == takeaway
          ? _value.takeaway
          : takeaway // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveOrderModelImplCopyWith<$Res>
    implements $ActiveOrderModelCopyWith<$Res> {
  factory _$$ActiveOrderModelImplCopyWith(_$ActiveOrderModelImpl value,
          $Res Function(_$ActiveOrderModelImpl) then) =
      __$$ActiveOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String tableNumber, String time, bool takeaway});
}

/// @nodoc
class __$$ActiveOrderModelImplCopyWithImpl<$Res>
    extends _$ActiveOrderModelCopyWithImpl<$Res, _$ActiveOrderModelImpl>
    implements _$$ActiveOrderModelImplCopyWith<$Res> {
  __$$ActiveOrderModelImplCopyWithImpl(_$ActiveOrderModelImpl _value,
      $Res Function(_$ActiveOrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableNumber = null,
    Object? time = null,
    Object? takeaway = null,
  }) {
    return _then(_$ActiveOrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      takeaway: null == takeaway
          ? _value.takeaway
          : takeaway // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ActiveOrderModelImpl extends _ActiveOrderModel {
  const _$ActiveOrderModelImpl(
      {required this.id,
      required this.tableNumber,
      required this.time,
      required this.takeaway})
      : super._();

  @override
  final String id;
  @override
  final String tableNumber;
  @override
  final String time;
  @override
  final bool takeaway;

  @override
  String toString() {
    return 'ActiveOrderModel(id: $id, tableNumber: $tableNumber, time: $time, takeaway: $takeaway)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.takeaway, takeaway) ||
                other.takeaway == takeaway));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, tableNumber, time, takeaway);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveOrderModelImplCopyWith<_$ActiveOrderModelImpl> get copyWith =>
      __$$ActiveOrderModelImplCopyWithImpl<_$ActiveOrderModelImpl>(
          this, _$identity);
}

abstract class _ActiveOrderModel extends ActiveOrderModel {
  const factory _ActiveOrderModel(
      {required final String id,
      required final String tableNumber,
      required final String time,
      required final bool takeaway}) = _$ActiveOrderModelImpl;
  const _ActiveOrderModel._() : super._();

  @override
  String get id;
  @override
  String get tableNumber;
  @override
  String get time;
  @override
  bool get takeaway;
  @override
  @JsonKey(ignore: true)
  _$$ActiveOrderModelImplCopyWith<_$ActiveOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
