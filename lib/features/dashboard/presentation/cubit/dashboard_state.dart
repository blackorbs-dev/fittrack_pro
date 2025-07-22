part of 'dashboard_cubit.dart';

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = Initial;
  const factory DashboardState.loaded({
    required WorkoutStats workoutStats,
    required ChartType selectedChart,
    String? errorMessage
  }) = Loaded;
}
