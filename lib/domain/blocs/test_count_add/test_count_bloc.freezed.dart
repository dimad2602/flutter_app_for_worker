// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_count_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TestCountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) addCount,
    required TResult Function(Item item) addItem,
    required TResult Function(int index) reduceCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? addCount,
    TResult? Function(Item item)? addItem,
    TResult? Function(int index)? reduceCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? addCount,
    TResult Function(Item item)? addItem,
    TResult Function(int index)? reduceCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCount value) addCount,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_ReduceCount value) reduceCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCount value)? addCount,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_ReduceCount value)? reduceCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCount value)? addCount,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_ReduceCount value)? reduceCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestCountEventCopyWith<$Res> {
  factory $TestCountEventCopyWith(
          TestCountEvent value, $Res Function(TestCountEvent) then) =
      _$TestCountEventCopyWithImpl<$Res, TestCountEvent>;
}

/// @nodoc
class _$TestCountEventCopyWithImpl<$Res, $Val extends TestCountEvent>
    implements $TestCountEventCopyWith<$Res> {
  _$TestCountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddCountImplCopyWith<$Res> {
  factory _$$AddCountImplCopyWith(
          _$AddCountImpl value, $Res Function(_$AddCountImpl) then) =
      __$$AddCountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$AddCountImplCopyWithImpl<$Res>
    extends _$TestCountEventCopyWithImpl<$Res, _$AddCountImpl>
    implements _$$AddCountImplCopyWith<$Res> {
  __$$AddCountImplCopyWithImpl(
      _$AddCountImpl _value, $Res Function(_$AddCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$AddCountImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddCountImpl implements _AddCount {
  const _$AddCountImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'TestCountEvent.addCount(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCountImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCountImplCopyWith<_$AddCountImpl> get copyWith =>
      __$$AddCountImplCopyWithImpl<_$AddCountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) addCount,
    required TResult Function(Item item) addItem,
    required TResult Function(int index) reduceCount,
  }) {
    return addCount(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? addCount,
    TResult? Function(Item item)? addItem,
    TResult? Function(int index)? reduceCount,
  }) {
    return addCount?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? addCount,
    TResult Function(Item item)? addItem,
    TResult Function(int index)? reduceCount,
    required TResult orElse(),
  }) {
    if (addCount != null) {
      return addCount(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCount value) addCount,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_ReduceCount value) reduceCount,
  }) {
    return addCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCount value)? addCount,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_ReduceCount value)? reduceCount,
  }) {
    return addCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCount value)? addCount,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_ReduceCount value)? reduceCount,
    required TResult orElse(),
  }) {
    if (addCount != null) {
      return addCount(this);
    }
    return orElse();
  }
}

abstract class _AddCount implements TestCountEvent {
  const factory _AddCount({required final int index}) = _$AddCountImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$AddCountImplCopyWith<_$AddCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemImplCopyWith<$Res> {
  factory _$$AddItemImplCopyWith(
          _$AddItemImpl value, $Res Function(_$AddItemImpl) then) =
      __$$AddItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddItemImplCopyWithImpl<$Res>
    extends _$TestCountEventCopyWithImpl<$Res, _$AddItemImpl>
    implements _$$AddItemImplCopyWith<$Res> {
  __$$AddItemImplCopyWithImpl(
      _$AddItemImpl _value, $Res Function(_$AddItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddItemImpl implements _AddItem {
  const _$AddItemImpl({required this.item});

  @override
  final Item item;

  @override
  String toString() {
    return 'TestCountEvent.addItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      __$$AddItemImplCopyWithImpl<_$AddItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) addCount,
    required TResult Function(Item item) addItem,
    required TResult Function(int index) reduceCount,
  }) {
    return addItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? addCount,
    TResult? Function(Item item)? addItem,
    TResult? Function(int index)? reduceCount,
  }) {
    return addItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? addCount,
    TResult Function(Item item)? addItem,
    TResult Function(int index)? reduceCount,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCount value) addCount,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_ReduceCount value) reduceCount,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCount value)? addCount,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_ReduceCount value)? reduceCount,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCount value)? addCount,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_ReduceCount value)? reduceCount,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class _AddItem implements TestCountEvent {
  const factory _AddItem({required final Item item}) = _$AddItemImpl;

  Item get item;
  @JsonKey(ignore: true)
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReduceCountImplCopyWith<$Res> {
  factory _$$ReduceCountImplCopyWith(
          _$ReduceCountImpl value, $Res Function(_$ReduceCountImpl) then) =
      __$$ReduceCountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ReduceCountImplCopyWithImpl<$Res>
    extends _$TestCountEventCopyWithImpl<$Res, _$ReduceCountImpl>
    implements _$$ReduceCountImplCopyWith<$Res> {
  __$$ReduceCountImplCopyWithImpl(
      _$ReduceCountImpl _value, $Res Function(_$ReduceCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ReduceCountImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReduceCountImpl implements _ReduceCount {
  const _$ReduceCountImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'TestCountEvent.reduceCount(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReduceCountImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReduceCountImplCopyWith<_$ReduceCountImpl> get copyWith =>
      __$$ReduceCountImplCopyWithImpl<_$ReduceCountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) addCount,
    required TResult Function(Item item) addItem,
    required TResult Function(int index) reduceCount,
  }) {
    return reduceCount(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? addCount,
    TResult? Function(Item item)? addItem,
    TResult? Function(int index)? reduceCount,
  }) {
    return reduceCount?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? addCount,
    TResult Function(Item item)? addItem,
    TResult Function(int index)? reduceCount,
    required TResult orElse(),
  }) {
    if (reduceCount != null) {
      return reduceCount(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCount value) addCount,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_ReduceCount value) reduceCount,
  }) {
    return reduceCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCount value)? addCount,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_ReduceCount value)? reduceCount,
  }) {
    return reduceCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCount value)? addCount,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_ReduceCount value)? reduceCount,
    required TResult orElse(),
  }) {
    if (reduceCount != null) {
      return reduceCount(this);
    }
    return orElse();
  }
}

abstract class _ReduceCount implements TestCountEvent {
  const factory _ReduceCount({required final int index}) = _$ReduceCountImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ReduceCountImplCopyWith<_$ReduceCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TestCountState {
  int get number => throw _privateConstructorUsedError;
  List<int>? get listNumber => throw _privateConstructorUsedError;
  List<Item> get itemList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int number, List<int>? listNumber, List<Item> itemList)
        counter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int number, List<int>? listNumber, List<Item> itemList)?
        counter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number, List<int>? listNumber, List<Item> itemList)?
        counter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Counter value) counter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Counter value)? counter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Counter value)? counter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestCountStateCopyWith<TestCountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestCountStateCopyWith<$Res> {
  factory $TestCountStateCopyWith(
          TestCountState value, $Res Function(TestCountState) then) =
      _$TestCountStateCopyWithImpl<$Res, TestCountState>;
  @useResult
  $Res call({int number, List<int>? listNumber, List<Item> itemList});
}

/// @nodoc
class _$TestCountStateCopyWithImpl<$Res, $Val extends TestCountState>
    implements $TestCountStateCopyWith<$Res> {
  _$TestCountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? listNumber = freezed,
    Object? itemList = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      listNumber: freezed == listNumber
          ? _value.listNumber
          : listNumber // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      itemList: null == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterImplCopyWith<$Res>
    implements $TestCountStateCopyWith<$Res> {
  factory _$$CounterImplCopyWith(
          _$CounterImpl value, $Res Function(_$CounterImpl) then) =
      __$$CounterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, List<int>? listNumber, List<Item> itemList});
}

/// @nodoc
class __$$CounterImplCopyWithImpl<$Res>
    extends _$TestCountStateCopyWithImpl<$Res, _$CounterImpl>
    implements _$$CounterImplCopyWith<$Res> {
  __$$CounterImplCopyWithImpl(
      _$CounterImpl _value, $Res Function(_$CounterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? listNumber = freezed,
    Object? itemList = null,
  }) {
    return _then(_$CounterImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      listNumber: freezed == listNumber
          ? _value._listNumber
          : listNumber // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      itemList: null == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc

class _$CounterImpl implements _Counter {
  const _$CounterImpl(
      {required this.number,
      final List<int>? listNumber,
      required final List<Item> itemList})
      : _listNumber = listNumber,
        _itemList = itemList;

  @override
  final int number;
  final List<int>? _listNumber;
  @override
  List<int>? get listNumber {
    final value = _listNumber;
    if (value == null) return null;
    if (_listNumber is EqualUnmodifiableListView) return _listNumber;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Item> _itemList;
  @override
  List<Item> get itemList {
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemList);
  }

  @override
  String toString() {
    return 'TestCountState.counter(number: $number, listNumber: $listNumber, itemList: $itemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality()
                .equals(other._listNumber, _listNumber) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      const DeepCollectionEquality().hash(_listNumber),
      const DeepCollectionEquality().hash(_itemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      __$$CounterImplCopyWithImpl<_$CounterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int number, List<int>? listNumber, List<Item> itemList)
        counter,
  }) {
    return counter(number, listNumber, itemList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int number, List<int>? listNumber, List<Item> itemList)?
        counter,
  }) {
    return counter?.call(number, listNumber, itemList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number, List<int>? listNumber, List<Item> itemList)?
        counter,
    required TResult orElse(),
  }) {
    if (counter != null) {
      return counter(number, listNumber, itemList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Counter value) counter,
  }) {
    return counter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Counter value)? counter,
  }) {
    return counter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Counter value)? counter,
    required TResult orElse(),
  }) {
    if (counter != null) {
      return counter(this);
    }
    return orElse();
  }
}

abstract class _Counter implements TestCountState {
  const factory _Counter(
      {required final int number,
      final List<int>? listNumber,
      required final List<Item> itemList}) = _$CounterImpl;

  @override
  int get number;
  @override
  List<int>? get listNumber;
  @override
  List<Item> get itemList;
  @override
  @JsonKey(ignore: true)
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
