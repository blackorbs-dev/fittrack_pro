// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutSession {
  String get sessionId;
  int get totalWorkouts;
  int get caloriesBurned;
  Duration get duration;
  int get averageHeartRate;
  DateTime get timestamp;
  List<DataPoint> get caloriesOverTime;
  List<DataPoint> get heartRateOverTime;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutSessionCopyWith<WorkoutSession> get copyWith =>
      _$WorkoutSessionCopyWithImpl<WorkoutSession>(
          this as WorkoutSession, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkoutSession &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other.caloriesOverTime, caloriesOverTime) &&
            const DeepCollectionEquality()
                .equals(other.heartRateOverTime, heartRateOverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      totalWorkouts,
      caloriesBurned,
      duration,
      averageHeartRate,
      timestamp,
      const DeepCollectionEquality().hash(caloriesOverTime),
      const DeepCollectionEquality().hash(heartRateOverTime));

  @override
  String toString() {
    return 'WorkoutSession(sessionId: $sessionId, totalWorkouts: $totalWorkouts, caloriesBurned: $caloriesBurned, duration: $duration, averageHeartRate: $averageHeartRate, timestamp: $timestamp, caloriesOverTime: $caloriesOverTime, heartRateOverTime: $heartRateOverTime)';
  }
}

/// @nodoc
abstract mixin class $WorkoutSessionCopyWith<$Res> {
  factory $WorkoutSessionCopyWith(
          WorkoutSession value, $Res Function(WorkoutSession) _then) =
      _$WorkoutSessionCopyWithImpl;
  @useResult
  $Res call(
      {String sessionId,
      int totalWorkouts,
      int caloriesBurned,
      Duration duration,
      int averageHeartRate,
      DateTime timestamp,
      List<DataPoint> caloriesOverTime,
      List<DataPoint> heartRateOverTime});
}

/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._self, this._then);

  final WorkoutSession _self;
  final $Res Function(WorkoutSession) _then;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? totalWorkouts = null,
    Object? caloriesBurned = null,
    Object? duration = null,
    Object? averageHeartRate = null,
    Object? timestamp = null,
    Object? caloriesOverTime = null,
    Object? heartRateOverTime = null,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      totalWorkouts: null == totalWorkouts
          ? _self.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _self.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      averageHeartRate: null == averageHeartRate
          ? _self.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      caloriesOverTime: null == caloriesOverTime
          ? _self.caloriesOverTime
          : caloriesOverTime // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      heartRateOverTime: null == heartRateOverTime
          ? _self.heartRateOverTime
          : heartRateOverTime // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
    ));
  }
}

/// @nodoc

class _WorkoutSession implements WorkoutSession {
  const _WorkoutSession(
      {required this.sessionId,
      required this.totalWorkouts,
      required this.caloriesBurned,
      required this.duration,
      required this.averageHeartRate,
      required this.timestamp,
      required final List<DataPoint> caloriesOverTime,
      required final List<DataPoint> heartRateOverTime})
      : _caloriesOverTime = caloriesOverTime,
        _heartRateOverTime = heartRateOverTime;

  @override
  final String sessionId;
  @override
  final int totalWorkouts;
  @override
  final int caloriesBurned;
  @override
  final Duration duration;
  @override
  final int averageHeartRate;
  @override
  final DateTime timestamp;
  final List<DataPoint> _caloriesOverTime;
  @override
  List<DataPoint> get caloriesOverTime {
    if (_caloriesOverTime is EqualUnmodifiableListView)
      return _caloriesOverTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_caloriesOverTime);
  }

  final List<DataPoint> _heartRateOverTime;
  @override
  List<DataPoint> get heartRateOverTime {
    if (_heartRateOverTime is EqualUnmodifiableListView)
      return _heartRateOverTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_heartRateOverTime);
  }

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutSessionCopyWith<_WorkoutSession> get copyWith =>
      __$WorkoutSessionCopyWithImpl<_WorkoutSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutSession &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._caloriesOverTime, _caloriesOverTime) &&
            const DeepCollectionEquality()
                .equals(other._heartRateOverTime, _heartRateOverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      totalWorkouts,
      caloriesBurned,
      duration,
      averageHeartRate,
      timestamp,
      const DeepCollectionEquality().hash(_caloriesOverTime),
      const DeepCollectionEquality().hash(_heartRateOverTime));

  @override
  String toString() {
    return 'WorkoutSession(sessionId: $sessionId, totalWorkouts: $totalWorkouts, caloriesBurned: $caloriesBurned, duration: $duration, averageHeartRate: $averageHeartRate, timestamp: $timestamp, caloriesOverTime: $caloriesOverTime, heartRateOverTime: $heartRateOverTime)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutSessionCopyWith<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  factory _$WorkoutSessionCopyWith(
          _WorkoutSession value, $Res Function(_WorkoutSession) _then) =
      __$WorkoutSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sessionId,
      int totalWorkouts,
      int caloriesBurned,
      Duration duration,
      int averageHeartRate,
      DateTime timestamp,
      List<DataPoint> caloriesOverTime,
      List<DataPoint> heartRateOverTime});
}

/// @nodoc
class __$WorkoutSessionCopyWithImpl<$Res>
    implements _$WorkoutSessionCopyWith<$Res> {
  __$WorkoutSessionCopyWithImpl(this._self, this._then);

  final _WorkoutSession _self;
  final $Res Function(_WorkoutSession) _then;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? totalWorkouts = null,
    Object? caloriesBurned = null,
    Object? duration = null,
    Object? averageHeartRate = null,
    Object? timestamp = null,
    Object? caloriesOverTime = null,
    Object? heartRateOverTime = null,
  }) {
    return _then(_WorkoutSession(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      totalWorkouts: null == totalWorkouts
          ? _self.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _self.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      averageHeartRate: null == averageHeartRate
          ? _self.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      caloriesOverTime: null == caloriesOverTime
          ? _self._caloriesOverTime
          : caloriesOverTime // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      heartRateOverTime: null == heartRateOverTime
          ? _self._heartRateOverTime
          : heartRateOverTime // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
    ));
  }
}

// dart format on
