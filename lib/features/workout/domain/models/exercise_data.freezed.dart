// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseData {
  int get currentExerciseNumber;
  String get currentExercise;
  int get totalExercises;
  int get timeRemaining;
  bool get isPaused;
  bool get isStopped;
  int get heartRate;
  String get sessionId;
  String get message;

  /// Create a copy of ExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseDataCopyWith<ExerciseData> get copyWith =>
      _$ExerciseDataCopyWithImpl<ExerciseData>(
          this as ExerciseData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExerciseData &&
            (identical(other.currentExerciseNumber, currentExerciseNumber) ||
                other.currentExerciseNumber == currentExerciseNumber) &&
            (identical(other.currentExercise, currentExercise) ||
                other.currentExercise == currentExercise) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.isStopped, isStopped) ||
                other.isStopped == isStopped) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentExerciseNumber,
      currentExercise,
      totalExercises,
      timeRemaining,
      isPaused,
      isStopped,
      heartRate,
      sessionId,
      message);

  @override
  String toString() {
    return 'ExerciseData(currentExerciseNumber: $currentExerciseNumber, currentExercise: $currentExercise, totalExercises: $totalExercises, timeRemaining: $timeRemaining, isPaused: $isPaused, isStopped: $isStopped, heartRate: $heartRate, sessionId: $sessionId, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ExerciseDataCopyWith<$Res> {
  factory $ExerciseDataCopyWith(
          ExerciseData value, $Res Function(ExerciseData) _then) =
      _$ExerciseDataCopyWithImpl;
  @useResult
  $Res call(
      {int currentExerciseNumber,
      String currentExercise,
      int totalExercises,
      int timeRemaining,
      bool isPaused,
      bool isStopped,
      int heartRate,
      String sessionId,
      String message});
}

/// @nodoc
class _$ExerciseDataCopyWithImpl<$Res> implements $ExerciseDataCopyWith<$Res> {
  _$ExerciseDataCopyWithImpl(this._self, this._then);

  final ExerciseData _self;
  final $Res Function(ExerciseData) _then;

  /// Create a copy of ExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentExerciseNumber = null,
    Object? currentExercise = null,
    Object? totalExercises = null,
    Object? timeRemaining = null,
    Object? isPaused = null,
    Object? isStopped = null,
    Object? heartRate = null,
    Object? sessionId = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      currentExerciseNumber: null == currentExerciseNumber
          ? _self.currentExerciseNumber
          : currentExerciseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      currentExercise: null == currentExercise
          ? _self.currentExercise
          : currentExercise // ignore: cast_nullable_to_non_nullable
              as String,
      totalExercises: null == totalExercises
          ? _self.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      timeRemaining: null == timeRemaining
          ? _self.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      isPaused: null == isPaused
          ? _self.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      isStopped: null == isStopped
          ? _self.isStopped
          : isStopped // ignore: cast_nullable_to_non_nullable
              as bool,
      heartRate: null == heartRate
          ? _self.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ExerciseData implements ExerciseData {
  const _ExerciseData(
      {required this.currentExerciseNumber,
      required this.currentExercise,
      required this.totalExercises,
      required this.timeRemaining,
      required this.isPaused,
      required this.isStopped,
      required this.heartRate,
      required this.sessionId,
      required this.message});

  @override
  final int currentExerciseNumber;
  @override
  final String currentExercise;
  @override
  final int totalExercises;
  @override
  final int timeRemaining;
  @override
  final bool isPaused;
  @override
  final bool isStopped;
  @override
  final int heartRate;
  @override
  final String sessionId;
  @override
  final String message;

  /// Create a copy of ExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseDataCopyWith<_ExerciseData> get copyWith =>
      __$ExerciseDataCopyWithImpl<_ExerciseData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExerciseData &&
            (identical(other.currentExerciseNumber, currentExerciseNumber) ||
                other.currentExerciseNumber == currentExerciseNumber) &&
            (identical(other.currentExercise, currentExercise) ||
                other.currentExercise == currentExercise) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.isStopped, isStopped) ||
                other.isStopped == isStopped) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentExerciseNumber,
      currentExercise,
      totalExercises,
      timeRemaining,
      isPaused,
      isStopped,
      heartRate,
      sessionId,
      message);

  @override
  String toString() {
    return 'ExerciseData(currentExerciseNumber: $currentExerciseNumber, currentExercise: $currentExercise, totalExercises: $totalExercises, timeRemaining: $timeRemaining, isPaused: $isPaused, isStopped: $isStopped, heartRate: $heartRate, sessionId: $sessionId, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseDataCopyWith<$Res>
    implements $ExerciseDataCopyWith<$Res> {
  factory _$ExerciseDataCopyWith(
          _ExerciseData value, $Res Function(_ExerciseData) _then) =
      __$ExerciseDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentExerciseNumber,
      String currentExercise,
      int totalExercises,
      int timeRemaining,
      bool isPaused,
      bool isStopped,
      int heartRate,
      String sessionId,
      String message});
}

/// @nodoc
class __$ExerciseDataCopyWithImpl<$Res>
    implements _$ExerciseDataCopyWith<$Res> {
  __$ExerciseDataCopyWithImpl(this._self, this._then);

  final _ExerciseData _self;
  final $Res Function(_ExerciseData) _then;

  /// Create a copy of ExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentExerciseNumber = null,
    Object? currentExercise = null,
    Object? totalExercises = null,
    Object? timeRemaining = null,
    Object? isPaused = null,
    Object? isStopped = null,
    Object? heartRate = null,
    Object? sessionId = null,
    Object? message = null,
  }) {
    return _then(_ExerciseData(
      currentExerciseNumber: null == currentExerciseNumber
          ? _self.currentExerciseNumber
          : currentExerciseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      currentExercise: null == currentExercise
          ? _self.currentExercise
          : currentExercise // ignore: cast_nullable_to_non_nullable
              as String,
      totalExercises: null == totalExercises
          ? _self.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      timeRemaining: null == timeRemaining
          ? _self.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      isPaused: null == isPaused
          ? _self.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      isStopped: null == isStopped
          ? _self.isStopped
          : isStopped // ignore: cast_nullable_to_non_nullable
              as bool,
      heartRate: null == heartRate
          ? _self.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
