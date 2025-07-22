import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/exercise_data.dart';

part 'workout_state.freezed.dart';

@freezed
sealed class WorkoutState with _$WorkoutState {
  const factory WorkoutState.initial() = Initial;
  const factory WorkoutState.loaded(ExerciseData data, {String? errorMessage}) = Loaded;
}
