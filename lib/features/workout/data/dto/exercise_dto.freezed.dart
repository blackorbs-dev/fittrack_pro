// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseDto {
  int get currentExerciseNumber;
  String get sessionId;
  String get currentExercise;
  int get totalExercises;
  int get timeRemaining;
  int get heartRate;
  bool get isPaused;
  bool get isStopped;
  String get message;

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseDtoCopyWith<ExerciseDto> get copyWith =>
      _$ExerciseDtoCopyWithImpl<ExerciseDto>(this as ExerciseDto, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExerciseDto &&
            (identical(other.currentExerciseNumber, currentExerciseNumber) ||
                other.currentExerciseNumber == currentExerciseNumber) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.currentExercise, currentExercise) ||
                other.currentExercise == currentExercise) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.isStopped, isStopped) ||
                other.isStopped == isStopped) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentExerciseNumber,
      sessionId,
      currentExercise,
      totalExercises,
      timeRemaining,
      heartRate,
      isPaused,
      isStopped,
      message);

  @override
  String toString() {
    return 'ExerciseDto(currentExerciseNumber: $currentExerciseNumber, sessionId: $sessionId, currentExercise: $currentExercise, totalExercises: $totalExercises, timeRemaining: $timeRemaining, heartRate: $heartRate, isPaused: $isPaused, isStopped: $isStopped, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ExerciseDtoCopyWith<$Res> {
  factory $ExerciseDtoCopyWith(
          ExerciseDto value, $Res Function(ExerciseDto) _then) =
      _$ExerciseDtoCopyWithImpl;
  @useResult
  $Res call(
      {int currentExerciseNumber,
      String currentExercise,
      int totalExercises,
      int timeRemaining,
      bool isPaused,
      int heartRate,
      String sessionId,
      String message,
      bool isStopped});
}

/// @nodoc
class _$ExerciseDtoCopyWithImpl<$Res> implements $ExerciseDtoCopyWith<$Res> {
  _$ExerciseDtoCopyWithImpl(this._self, this._then);

  final ExerciseDto _self;
  final $Res Function(ExerciseDto) _then;

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentExerciseNumber = null,
    Object? currentExercise = null,
    Object? totalExercises = null,
    Object? timeRemaining = null,
    Object? isPaused = null,
    Object? heartRate = null,
    Object? sessionId = null,
    Object? message = null,
    Object? isStopped = null,
  }) {
    return _then(ExerciseDto(
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
      isStopped: null == isStopped
          ? _self.isStopped
          : isStopped // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
