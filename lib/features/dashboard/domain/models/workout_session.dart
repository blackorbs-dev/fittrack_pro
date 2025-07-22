import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_point.dart';

part 'workout_session.freezed.dart';

@freezed
abstract class WorkoutSession with _$WorkoutSession{
  const factory WorkoutSession({
    required String sessionId,
    required int totalWorkouts,
    required int caloriesBurned,
    required Duration duration,
    required int averageHeartRate,
    required DateTime timestamp,
    required List<DataPoint> caloriesOverTime,
    required List<DataPoint> heartRateOverTime,
  }) = _WorkoutSession;
}
