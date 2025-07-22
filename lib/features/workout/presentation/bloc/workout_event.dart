import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/exercise_data.dart';

part 'workout_event.freezed.dart';

@freezed
class WorkoutEvent with _$WorkoutEvent {
  const factory WorkoutEvent.started() = Started;
  const factory WorkoutEvent.stopped() = Stopped;
  const factory WorkoutEvent.paused() = Paused;
  const factory WorkoutEvent.resumed() = Resumed;
  const factory WorkoutEvent.pausedOrResumed() = PausedOrResumed;
  const factory WorkoutEvent.updated(ExerciseData data) = Updated;
  const factory WorkoutEvent.nextExercise() = NextExercise;
  const factory WorkoutEvent.previousExercise() = PreviousExercise;
  const factory WorkoutEvent.resetError() = ResetError;
}
