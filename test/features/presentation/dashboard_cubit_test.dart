import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:fittrack_pro/core/error/error.dart';
import 'package:fittrack_pro/core/service/notification_service.dart';
import 'package:fittrack_pro/core/util/response.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/chart_type.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/data_point.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/workout_session.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/workout_stats.dart';
import 'package:fittrack_pro/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fittrack_pro/features/workout/domain/models/exercise_data.dart';
import 'package:fittrack_pro/features/workout/domain/repository/workout_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../util/mock_instances.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

class MockNotificationService extends Mock implements NotificationService {}

void main() {
  late MockWorkoutRepository repository;
  late MockNotificationService notificationService;
  late StreamController<List<WorkoutSession>> historyStream;
  late StreamController<ExerciseData> exerciseStream;
  late StreamController<String> notificationActionStream;

  final session = WorkoutSession(
    sessionId: 'id1',
    totalWorkouts: 1,
    caloriesBurned: 300,
    duration: const Duration(minutes: 30),
    averageHeartRate: 120,
    timestamp: DateTime.now(),
    heartRateOverTime: [
      DataPoint(time: DateTime.now().subtract(const Duration(seconds: 5)), value: 110),
      DataPoint(time: DateTime.now(), value: 130),
    ],
    caloriesOverTime: [
      DataPoint(time: DateTime.now().subtract(const Duration(seconds: 3)), value: 150),
    ],
  );

  final testExerciseData = exerciseData();

  setUp(() {
    repository = MockWorkoutRepository();
    notificationService = MockNotificationService();

    historyStream = StreamController.broadcast();
    exerciseStream = StreamController.broadcast();
    notificationActionStream = StreamController.broadcast();
    registerFallbackValue(exerciseData());

    when(() => repository.getWorkoutHistoryStream())
        .thenAnswer((_) => historyStream.stream);

    when(() => repository.getExerciseDataStream())
        .thenAnswer((_) => exerciseStream.stream);

    when(() => notificationService.onNotificationAction)
        .thenAnswer((_) => notificationActionStream.stream);

    when(() => notificationService.showWorkoutNotification(any()))
        .thenReturn(null);
  });

  tearDown(() async {
    await historyStream.close();
    await exerciseStream.close();
    await notificationActionStream.close();
  });

  blocTest<DashboardCubit, DashboardState>(
    'emits loaded with computed stats from workout history',
    build: () => DashboardCubit(repository, notificationService),
    act: (cubit) {
      historyStream.add([session]);
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      isA<Loaded>().having((s) => s.workoutStats.totalCaloriesBurned, 'calories', 300),
    ],
  );

  blocTest<DashboardCubit, DashboardState>(
    'calls startWorkout and emits error if already ongoing',
    build: () => DashboardCubit(repository, notificationService),
    seed: () => DashboardState.loaded(
      workoutStats: workoutStats(chartData: {}),
      selectedChart: ChartType.heartRate,
    ),
    act: (cubit) async{
      exerciseStream.add(testExerciseData.copyWith(isPaused: false, isStopped: false));
      await Future.delayed(const Duration(milliseconds: 100));
      cubit.startWorkout();
    },
    wait: const Duration(milliseconds: 50),
    expect: () => [
      isA<Loaded>().having((e) => e.errorMessage, 'errorMessage', 'Workout already in progress'),
    ],
  );

  blocTest<DashboardCubit, DashboardState>(
    'calls startWorkout successfully when workout not ongoing',
    build: () {
      when(() => repository.startWorkout())
          .thenAnswer((_) async => const Response.success(null));
      return DashboardCubit(repository, notificationService);
    },
    act: (cubit) {
      // not ongoing
      exerciseStream.add(testExerciseData.copyWith(isPaused: true, isStopped: true));
      cubit.startWorkout();
    },
    verify: (_) => verify(() => repository.startWorkout()).called(1)
  );

  blocTest<DashboardCubit, DashboardState>(
    'sets new chart type when setChart is called',
    build: () => DashboardCubit(repository, notificationService),
    seed: () => DashboardState.loaded(
      workoutStats: WorkoutStats(
        totalWorkouts: 1,
        totalCaloriesBurned: 100,
        totalDuration: const Duration(minutes: 20),
        averageHeartRate: 110,
        lastUpdated: DateTime.now(),
        chartData: {},
      ),
      selectedChart: ChartType.heartRate,
    ),
    act: (cubit) => cubit.setChart(ChartType.calories),
    expect: () => [
      isA<Loaded>().having((s) => s.selectedChart, 'chart', ChartType.calories),
    ],
  );

  blocTest<DashboardCubit, DashboardState>(
    'handles notification action and calls repository.sendAction',
    build: () {
      when(() => repository.sendAction(any()))
          .thenAnswer((_) async => const Response.success(null));
      return DashboardCubit(repository, notificationService);
    },
    act: (cubit) => notificationActionStream.add('nextExercise'),
    verify: (_) => verify(() => repository.sendAction('nextExercise')).called(1),
  );

  blocTest<DashboardCubit, DashboardState>(
    'emits error if notification action fails',
    seed: () => DashboardState.loaded(
      workoutStats: workoutStats(chartData: {}),
      selectedChart: ChartType.heartRate,
    ),
    build: () {
      when(() => repository.sendAction(any())).thenAnswer(
            (_) async => Response.error(DataError.message('Fail action')),
      );
      return DashboardCubit(repository, notificationService);
    },
    act: (cubit) => notificationActionStream.add('failAction'),
    expect: () => [
      isA<Loaded>().having((e) => e.errorMessage, 'error', 'Fail action'),
    ],
  );

  blocTest<DashboardCubit, DashboardState>(
    'clears error when resetError is called',
    build: () => DashboardCubit(repository, notificationService),
    seed: () => DashboardState.loaded(
      workoutStats: WorkoutStats(
        totalWorkouts: 1,
        totalCaloriesBurned: 100,
        totalDuration: const Duration(minutes: 20),
        averageHeartRate: 110,
        lastUpdated: DateTime.now(),
        chartData: {},
      ),
      selectedChart: ChartType.calories,
      errorMessage: 'Old error',
    ),
    act: (cubit) => cubit.resetError(),
    expect: () => [
      isA<Loaded>().having((e) => e.errorMessage, 'errorMessage', null),
    ],
  );

  test('disposes streams and notificationService on close', () async {
    final cubit = DashboardCubit(repository, notificationService);
    await cubit.close();
    verify(() => notificationService.dispose()).called(1);
  });
}