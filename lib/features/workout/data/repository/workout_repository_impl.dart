import 'dart:async';
import 'dart:convert';

import 'package:fittrack_pro/core/util/safe_caller.dart';
import 'package:fittrack_pro/features/workout/data/mapper/excercise_data_mapper.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/error.dart';
import '../../../../core/util/response.dart';
import '../../../dashboard/domain/models/data_point.dart';
import '../../../dashboard/domain/models/workout_session.dart';
import '../../domain/models/exercise_data.dart';
import '../../domain/repository/workout_repository.dart';
import '../dto/exercise_dto.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  static const _channel = MethodChannel(AppConstant.methodChannelName);
  static const _events = EventChannel(AppConstant.eventChannelName);

  final _historyController = StreamController<List<WorkoutSession>>.broadcast();
  final _exerciseDataController = StreamController<ExerciseData>.broadcast();

  final List<WorkoutSession> _history = [];

  String? _activeSessionId;

  WorkoutRepositoryImpl() {
    // observe exercise data stream from background service on initialize repository
    _events.receiveBroadcastStream().listen((event) {
      safeCall((){
        final map = Map<String, dynamic>.from(jsonDecode(event));
        final data = ExerciseDto.fromJson(map).toData();
        _updateSession(data);
        _exerciseDataController.add(data);
      });
    });
  }

  @override
  Stream<ExerciseData> getExerciseDataStream() => _exerciseDataController.stream;

  @override
  Stream<List<WorkoutSession>> getWorkoutHistoryStream() => _historyController.stream;

  @override
  Future<Response<void, DataError>> startWorkout() =>
      safeCall(() => _channel.invokeMethod(AppConstant.startWorkout));

  @override
  Future<Response<void, DataError>> pauseWorkout() =>
      safeCall(() => _channel.invokeMethod(AppConstant.pauseWorkout));

  @override
  Future<Response<void, DataError>> resumeWorkout() =>
      safeCall(() => _channel.invokeMethod(AppConstant.resumeWorkout));

  @override
  Future<Response<void, DataError>> stopWorkout() =>
      safeCall(() => _channel.invokeMethod(AppConstant.stopWorkout));

  @override
  Future<Response<void, DataError>> nextExercise() =>
      safeCall(() => _channel.invokeMethod(AppConstant.nextExercise));

  @override
  Future<Response<void, DataError>> previousExercise() =>
      safeCall(() => _channel.invokeMethod(AppConstant.previousExercise));

  @override
  Future<Response<void, DataError>> sendAction(String actionId) =>
      safeCall(() => _channel.invokeMethod(actionId));

  void _updateSession(ExerciseData data) {
    final sessionId = data.sessionId;

    if (_activeSessionId != sessionId) {
      // New session detected
      final newSession = WorkoutSession(
        sessionId: sessionId,
        totalWorkouts: _history.length + 1,
        caloriesBurned: 0,
        duration: Duration.zero,
        averageHeartRate: 0,
        timestamp: DateTime.now(),
        heartRateOverTime: [],
        caloriesOverTime: [],
      );

      _history.add(newSession);
      _activeSessionId = sessionId;
    }

    final current = _history.last;

    final now = DateTime.now();
    final updatedHR = [...current.heartRateOverTime, DataPoint(time: now, value: data.heartRate)];
    final totalHR = updatedHR.fold<int>(0, (sum, e) => sum + e.value);
    final count = updatedHR.length;

    // Compute calories
    final duration = current.duration + const Duration(seconds: 1);
    final calories = estimateCalories(duration.inSeconds);
    final updatedCalories = [...current.caloriesOverTime, DataPoint(time: now, value: calories)];

    final updated = current.copyWith(
      duration: current.duration + const Duration(seconds: 1),
      averageHeartRate: count == 0 ? 0 : (totalHR ~/ count),
      caloriesBurned: estimateCalories(current.duration.inSeconds),
      heartRateOverTime: updatedHR,
      caloriesOverTime: updatedCalories,
    );

    _history[_history.length - 1] = updated;
    _historyController.add(List.from(_history));
  }

  int estimateCalories(int seconds) => (seconds * 0.1).round();

  @override
  void dispose() {
    _historyController.close();
    _exerciseDataController.close();
  }
}
