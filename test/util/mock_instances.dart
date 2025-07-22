import 'dart:convert';

import 'package:fittrack_pro/features/dashboard/domain/models/chart_type.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/data_point.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/workout_stats.dart';
import 'package:fittrack_pro/features/workout/domain/models/exercise_data.dart';

WorkoutStats workoutStats({
  int workouts = 1,
  int calories = 100,
  Duration duration = const Duration(minutes: 20),
  int heartRate = 110,
  required Map<ChartType, List<DataPoint>> chartData
}) => WorkoutStats(
  totalWorkouts: workouts,
  totalCaloriesBurned: calories,
  totalDuration: duration,
  averageHeartRate: heartRate,
  lastUpdated: DateTime.now(),
  chartData: chartData,
);

ExerciseData exerciseData({
    String id = "",
    String currentExercise = "",
    int currentExerciseNumber = 0,
    int totalExercises = 0,
    int timeRemaining = 0,
    bool isPaused = true,
    bool isStopped = true,
    int heartRate = 0,
    String message = ""
}) => ExerciseData(
    currentExerciseNumber: currentExerciseNumber,
    currentExercise: currentExercise,
    totalExercises: totalExercises,
    timeRemaining: timeRemaining,
    isPaused: isPaused,
    isStopped: isStopped,
    heartRate: heartRate,
    sessionId: id,
    message: message
);

String exerciseDataJson({
    String id = "abc",
    int heartRate = 80,
    String currentExercise = "Push Ups",
    int currentExerciseNumber = 1,
    int totalExercises = 5,
    int timeRemaining = 1002,
    bool isStopped = false,
    bool isPaused = false,
    String message = "Workout ongoing"
}) => jsonEncode({
  "sessionId": id,
  "heartRate": heartRate,
  "currentExercise": currentExercise,
  "currentExerciseNumber": currentExerciseNumber,
  "totalExercises": totalExercises,
  "timeRemaining": timeRemaining,
  "isStopped": isStopped,
  "isPaused": isPaused,
  "message": message
});

