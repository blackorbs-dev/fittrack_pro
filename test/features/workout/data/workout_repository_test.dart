import 'dart:convert';
import 'package:fittrack_pro/core/util/response.dart';
import 'package:fittrack_pro/features/workout/domain/repository/workout_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fittrack_pro/core/constants/app_constants.dart';
import 'package:fittrack_pro/features/workout/data/repository/workout_repository_impl.dart';

import '../../../util/channel_util.dart';
import '../../../util/mock_instances.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late TestChannelUtils testUtils;
  late WorkoutRepository repository;

  setUp(() {
    testUtils = TestChannelUtils(
      methodChannelName: AppConstant.methodChannelName,
      eventChannelName: AppConstant.eventChannelName,
    );

    repository = WorkoutRepositoryImpl();
    testUtils.mockEventStream();
  });

  tearDown(() {
    testUtils.dispose();
    repository.dispose();
  });

  group('✅ MethodChannel', () {
    setUp(() {
      testUtils.mockMethodCalls((call) {
        switch (call.method) {
          case AppConstant.startWorkout:
          case AppConstant.pauseWorkout:
          case AppConstant.resumeWorkout:
          case AppConstant.stopWorkout:
          case AppConstant.nextExercise:
          case AppConstant.previousExercise:
            return {'result': null};
          default:
            return {
              'error': {'code': '404', 'message': 'Unknown method'}
            };
        }
      });
    });

    test('startWorkout returns success', () async {
      final result = await repository.startWorkout();
      expect(result, isA<SuccessResponse>());
    });

    test('pauseWorkout returns success', () async {
      final result = await repository.pauseWorkout();
      expect(result, isA<SuccessResponse>());
    });

    test('sendAction returns error for unknown method', () async {
      final result = await repository.sendAction('invalid');
      expect(result, isA<ErrorResponse>());
    });
  });

  group('❌ MethodChannel Error', () {
    setUp(() {
      testUtils.mockMethodCalls((_) {
        return {
          'error': {'code': '500', 'message': 'Simulated error'}
        };
      });
    });

    test('startWorkout returns error', () async {
      final result = await repository.startWorkout();
      expect(result, isA<ErrorResponse>());
    });
  });

  group('📡 EventChannel Stream', () {
    test('valid event emits ExerciseData', () async {
      testUtils.eventStreamController.add(exerciseDataJson(id: "abc"));

      final data = await repository.getExerciseDataStream().first;
      expect(data.sessionId, "abc");
    });

    test('updates workout history with new sessionId', () async {
      testUtils.eventStreamController.add(exerciseDataJson(id: "xyz"));

      final history = await repository.getWorkoutHistoryStream().first;
      expect(history.first.sessionId, "xyz");
    });
  });

  group('💥 EventChannel Error Cases', () {
    test('ignores invalid JSON string', () async {
      testUtils.eventStreamController.add('invalid');

      final data = await repository.getExerciseDataStream().first.timeout(
        const Duration(milliseconds: 200),
        onTimeout: () => exerciseData(),
      );

      expect(data.sessionId, isEmpty);
    });

    test('handles malformed JSON gracefully', () async {
      testUtils.eventStreamController.add(jsonEncode({"wrong": "structure"}));

      final data = await repository.getExerciseDataStream().first.timeout(
        const Duration(milliseconds: 200),
        onTimeout: () => exerciseData(),
      );

      expect(data.sessionId, isEmpty);
    });

  });
}
