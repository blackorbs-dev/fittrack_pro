import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_data.freezed.dart';

@freezed
abstract class ExerciseData with _$ExerciseData {
  const factory ExerciseData({
    required int currentExerciseNumber,
    required String currentExercise,
    required int totalExercises,
    required int timeRemaining,
    required bool isPaused,
    required bool isStopped,
    required int heartRate,
    required String sessionId,
    required String message
  }) = _ExerciseData;
}
