import 'dart:async';

import 'package:fittrack_pro/core/error/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/error.dart';
import '../../../../core/service/notification_service.dart';
import '../../../../core/util/response.dart';
import '../../../workout/domain/repository/workout_repository.dart';
import '../../domain/models/chart_type.dart';
import '../../domain/models/data_point.dart';
import '../../domain/models/workout_session.dart';
import '../../domain/models/workout_stats.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final WorkoutRepository _repository;
  final NotificationService _notificationService;

  StreamSubscription? _historySubscription;
  StreamSubscription? _exerciseSubscription;
  StreamSubscription? _notificationServiceSubscription;

  final Duration _maxChartWindow  = const Duration(seconds: 10); // maximum data points for chart
  bool _isWorkoutOngoing = false;

  DashboardCubit(this._repository, this._notificationService) : super(const DashboardState.initial()){
    _init();
  }

  void _init() {
    _historySubscription = _repository.getWorkoutHistoryStream().listen((history) {
      _computeStats(history);
    });
    _exerciseSubscription = _repository.getExerciseDataStream().listen((data) {
      _isWorkoutOngoing = !(data.isStopped || data.isPaused);
      _notificationService.showWorkoutNotification(data);
    });
    _notificationServiceSubscription = _notificationService.onNotificationAction
        .listen((actionId){
            _handleResponse(() => _repository.sendAction(actionId));
        });
  }

  void startWorkout(){
    if(_isWorkoutOngoing){
      _showError('Workout already in progress');
    }
    else {
      _handleResponse(_repository.startWorkout);
    }
  }


  void setChart(ChartType chart) {
    if(state case Loaded(:final workoutStats)){
      emit(
          DashboardState.loaded(
            workoutStats: workoutStats,
            selectedChart: chart,
          )
      );
    }
  }

  void _setData(WorkoutStats stats){
    final ChartType chart;
    if(state case Loaded(:final selectedChart)) {
      chart = selectedChart;
    } else {
      chart = ChartType.heartRate;
    }
    emit(
      DashboardState.loaded(workoutStats: stats, selectedChart: chart)
    );
  }

  void resetError() {
    if(state case Loaded(:final workoutStats, :final selectedChart)){
      emit(
          DashboardState.loaded(
              workoutStats: workoutStats,
              selectedChart: selectedChart
          )
      );
    }
  }

  Future<void> _handleResponse(Future<Response<void, DataError>> Function() request) async{
    final response = await request();
    response.onError((error) {
      _showError(error.message());
    });
  }

  void _showError(String message){
    if (state case Loaded(:final workoutStats, :final selectedChart)){
      emit(
          DashboardState.loaded(
              workoutStats: workoutStats,
              selectedChart: selectedChart ,
              errorMessage: message
          )
      );
    }
  }

  void _computeStats(List<WorkoutSession> sessions) {
    final now = DateTime.now();
    final totalWorkouts = sessions.length;
    final totalCalories = sessions.fold<int>(0, (sum, s) => sum + s.caloriesBurned);
    final totalDuration = sessions.fold<Duration>(Duration.zero, (sum, s) => sum + s.duration);

    // Gather all heart rate points
    final allPoints = sessions.expand((s) => s.heartRateOverTime).toList();
    final trimmedHR = _trimPoints(allPoints, _maxChartWindow);

    final avgHR = trimmedHR.isNotEmpty
        ? trimmedHR.map((e) => e.value).reduce((a, b) => a + b) ~/ trimmedHR.length
        : 0;

    // Calories chart data
    final allCaloriePoints = sessions.expand((s) => s.caloriesOverTime).toList();
    final trimmedCalories = _trimPoints(allCaloriePoints, _maxChartWindow);

    // Create chart data map
    final chartData = {
      ChartType.heartRate: trimmedHR,
      ChartType.calories: trimmedCalories,
    };

    _setData(
        WorkoutStats(
            totalWorkouts: totalWorkouts,
            totalCaloriesBurned: totalCalories,
            totalDuration: totalDuration,
            averageHeartRate: avgHR,
            lastUpdated: now,
            chartData: chartData
        )
    );
  }

  List<DataPoint> _trimPoints(List<DataPoint> points, Duration window) {
    final cutoff = DateTime.now().subtract(window);
    return points.where((p) => p.time.isAfter(cutoff)).toList();
  }

  @override
  Future<void> close() {
    _historySubscription?.cancel();
    _exerciseSubscription?.cancel();
    _notificationServiceSubscription?.cancel();
    _notificationService.dispose(); // scoped notification service can be disposed here
    return super.close();
  }
}
