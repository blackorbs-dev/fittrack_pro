// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutStats {
  int get totalWorkouts;
  int get totalCaloriesBurned;
  Duration get totalDuration;
  int get averageHeartRate;
  DateTime get lastUpdated;
  Map<ChartType, List<DataPoint>> get chartData;

  /// Create a copy of WorkoutStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutStatsCopyWith<WorkoutStats> get copyWith =>
      _$WorkoutStatsCopyWithImpl<WorkoutStats>(
          this as WorkoutStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkoutStats &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.totalCaloriesBurned, totalCaloriesBurned) ||
                other.totalCaloriesBurned == totalCaloriesBurned) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality().equals(other.chartData, chartData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalWorkouts,
      totalCaloriesBurned,
      totalDuration,
      averageHeartRate,
      lastUpdated,
      const DeepCollectionEquality().hash(chartData));

  @override
  String toString() {
    return 'WorkoutStats(totalWorkouts: $totalWorkouts, totalCaloriesBurned: $totalCaloriesBurned, totalDuration: $totalDuration, averageHeartRate: $averageHeartRate, lastUpdated: $lastUpdated, chartData: $chartData)';
  }
}

/// @nodoc
abstract mixin class $WorkoutStatsCopyWith<$Res> {
  factory $WorkoutStatsCopyWith(
          WorkoutStats value, $Res Function(WorkoutStats) _then) =
      _$WorkoutStatsCopyWithImpl;
  @useResult
  $Res call(
      {int totalWorkouts,
      int totalCaloriesBurned,
      Duration totalDuration,
      int averageHeartRate,
      DateTime lastUpdated,
      Map<ChartType, List<DataPoint>> chartData});
}

/// @nodoc
class _$WorkoutStatsCopyWithImpl<$Res> implements $WorkoutStatsCopyWith<$Res> {
  _$WorkoutStatsCopyWithImpl(this._self, this._then);

  final WorkoutStats _self;
  final $Res Function(WorkoutStats) _then;

  /// Create a copy of WorkoutStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWorkouts = null,
    Object? totalCaloriesBurned = null,
    Object? totalDuration = null,
    Object? averageHeartRate = null,
    Object? lastUpdated = null,
    Object? chartData = null,
  }) {
    return _then(_self.copyWith(
      totalWorkouts: null == totalWorkouts
          ? _self.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      totalCaloriesBurned: null == totalCaloriesBurned
          ? _self.totalCaloriesBurned
          : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _self.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      averageHeartRate: null == averageHeartRate
          ? _self.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chartData: null == chartData
          ? _self.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as Map<ChartType, List<DataPoint>>,
    ));
  }
}

/// @nodoc

class _WorkoutStats implements WorkoutStats {
  const _WorkoutStats(
      {required this.totalWorkouts,
      required this.totalCaloriesBurned,
      required this.totalDuration,
      required this.averageHeartRate,
      required this.lastUpdated,
      required final Map<ChartType, List<DataPoint>> chartData})
      : _chartData = chartData;

  @override
  final int totalWorkouts;
  @override
  final int totalCaloriesBurned;
  @override
  final Duration totalDuration;
  @override
  final int averageHeartRate;
  @override
  final DateTime lastUpdated;
  final Map<ChartType, List<DataPoint>> _chartData;
  @override
  Map<ChartType, List<DataPoint>> get chartData {
    if (_chartData is EqualUnmodifiableMapView) return _chartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chartData);
  }

  /// Create a copy of WorkoutStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutStatsCopyWith<_WorkoutStats> get copyWith =>
      __$WorkoutStatsCopyWithImpl<_WorkoutStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutStats &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.totalCaloriesBurned, totalCaloriesBurned) ||
                other.totalCaloriesBurned == totalCaloriesBurned) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._chartData, _chartData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalWorkouts,
      totalCaloriesBurned,
      totalDuration,
      averageHeartRate,
      lastUpdated,
      const DeepCollectionEquality().hash(_chartData));

  @override
  String toString() {
    return 'WorkoutStats(totalWorkouts: $totalWorkouts, totalCaloriesBurned: $totalCaloriesBurned, totalDuration: $totalDuration, averageHeartRate: $averageHeartRate, lastUpdated: $lastUpdated, chartData: $chartData)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutStatsCopyWith<$Res>
    implements $WorkoutStatsCopyWith<$Res> {
  factory _$WorkoutStatsCopyWith(
          _WorkoutStats value, $Res Function(_WorkoutStats) _then) =
      __$WorkoutStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalWorkouts,
      int totalCaloriesBurned,
      Duration totalDuration,
      int averageHeartRate,
      DateTime lastUpdated,
      Map<ChartType, List<DataPoint>> chartData});
}

/// @nodoc
class __$WorkoutStatsCopyWithImpl<$Res>
    implements _$WorkoutStatsCopyWith<$Res> {
  __$WorkoutStatsCopyWithImpl(this._self, this._then);

  final _WorkoutStats _self;
  final $Res Function(_WorkoutStats) _then;

  /// Create a copy of WorkoutStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalWorkouts = null,
    Object? totalCaloriesBurned = null,
    Object? totalDuration = null,
    Object? averageHeartRate = null,
    Object? lastUpdated = null,
    Object? chartData = null,
  }) {
    return _then(_WorkoutStats(
      totalWorkouts: null == totalWorkouts
          ? _self.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      totalCaloriesBurned: null == totalCaloriesBurned
          ? _self.totalCaloriesBurned
          : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _self.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      averageHeartRate: null == averageHeartRate
          ? _self.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chartData: null == chartData
          ? _self._chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as Map<ChartType, List<DataPoint>>,
    ));
  }
}

// dart format on
