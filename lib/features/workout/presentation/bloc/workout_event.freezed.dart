// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorkoutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent()';
  }
}

/// @nodoc
class $WorkoutEventCopyWith<$Res> {
  $WorkoutEventCopyWith(WorkoutEvent _, $Res Function(WorkoutEvent) __);
}

/// @nodoc

class Started implements WorkoutEvent {
  const Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.started()';
  }
}

/// @nodoc

class Stopped implements WorkoutEvent {
  const Stopped();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Stopped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.stopped()';
  }
}

/// @nodoc

class Paused implements WorkoutEvent {
  const Paused();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Paused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.paused()';
  }
}

/// @nodoc

class Resumed implements WorkoutEvent {
  const Resumed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Resumed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.resumed()';
  }
}

/// @nodoc

class PausedOrResumed implements WorkoutEvent {
  const PausedOrResumed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PausedOrResumed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.pausedOrResumed()';
  }
}

/// @nodoc

class Updated implements WorkoutEvent {
  const Updated(this.data);

  final ExerciseData data;

  /// Create a copy of WorkoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatedCopyWith<Updated> get copyWith =>
      _$UpdatedCopyWithImpl<Updated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Updated &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'WorkoutEvent.updated(data: $data)';
  }
}

/// @nodoc
abstract mixin class $UpdatedCopyWith<$Res>
    implements $WorkoutEventCopyWith<$Res> {
  factory $UpdatedCopyWith(Updated value, $Res Function(Updated) _then) =
      _$UpdatedCopyWithImpl;
  @useResult
  $Res call({ExerciseData data});

  $ExerciseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UpdatedCopyWithImpl<$Res> implements $UpdatedCopyWith<$Res> {
  _$UpdatedCopyWithImpl(this._self, this._then);

  final Updated _self;
  final $Res Function(Updated) _then;

  /// Create a copy of WorkoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(Updated(
      null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExerciseData,
    ));
  }

  /// Create a copy of WorkoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseDataCopyWith<$Res> get data {
    return $ExerciseDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc

class NextExercise implements WorkoutEvent {
  const NextExercise();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NextExercise);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.nextExercise()';
  }
}

/// @nodoc

class PreviousExercise implements WorkoutEvent {
  const PreviousExercise();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PreviousExercise);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.previousExercise()';
  }
}

/// @nodoc

class ResetError implements WorkoutEvent {
  const ResetError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResetError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkoutEvent.resetError()';
  }
}

// dart format on
