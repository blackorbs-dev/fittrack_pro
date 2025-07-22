// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataPoint {
  DateTime get time;
  int get value;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataPointCopyWith<DataPoint> get copyWith =>
      _$DataPointCopyWithImpl<DataPoint>(this as DataPoint, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataPoint &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, value);

  @override
  String toString() {
    return 'DataPoint(time: $time, value: $value)';
  }
}

/// @nodoc
abstract mixin class $DataPointCopyWith<$Res> {
  factory $DataPointCopyWith(DataPoint value, $Res Function(DataPoint) _then) =
      _$DataPointCopyWithImpl;
  @useResult
  $Res call({DateTime time, int value});
}

/// @nodoc
class _$DataPointCopyWithImpl<$Res> implements $DataPointCopyWith<$Res> {
  _$DataPointCopyWithImpl(this._self, this._then);

  final DataPoint _self;
  final $Res Function(DataPoint) _then;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _DataPoint implements DataPoint {
  const _DataPoint({required this.time, required this.value});

  @override
  final DateTime time;
  @override
  final int value;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataPointCopyWith<_DataPoint> get copyWith =>
      __$DataPointCopyWithImpl<_DataPoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataPoint &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, value);

  @override
  String toString() {
    return 'DataPoint(time: $time, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DataPointCopyWith<$Res>
    implements $DataPointCopyWith<$Res> {
  factory _$DataPointCopyWith(
          _DataPoint value, $Res Function(_DataPoint) _then) =
      __$DataPointCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime time, int value});
}

/// @nodoc
class __$DataPointCopyWithImpl<$Res> implements _$DataPointCopyWith<$Res> {
  __$DataPointCopyWithImpl(this._self, this._then);

  final _DataPoint _self;
  final $Res Function(_DataPoint) _then;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? time = null,
    Object? value = null,
  }) {
    return _then(_DataPoint(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
