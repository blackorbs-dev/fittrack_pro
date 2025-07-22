import 'package:freezed_annotation/freezed_annotation.dart';

import 'chart_type.dart';
import 'data_point.dart';

part 'workout_stats.freezed.dart';

@freezed
abstract class WorkoutStats with _$WorkoutStats {
  const factory WorkoutStats({
    required int totalWorkouts,
    required int totalCaloriesBurned,
    required Duration totalDuration,
    required int averageHeartRate,
    required DateTime lastUpdated,
    required Map<ChartType, List<DataPoint>> chartData,
  }) = _WorkoutStats;
}
