import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:fittrack_pro/core/error/error.dart';
import 'package:fittrack_pro/core/util/response.dart';
import 'package:fittrack_pro/features/workout/domain/models/exercise_data.dart';
import 'package:fittrack_pro/features/workout/domain/repository/workout_repository.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_bloc.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_event.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../util/mock_instances.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  late MockWorkoutRepository repository;
  late StreamController<ExerciseData> streamController;

  final tData = exerciseData(id: 's1', currentExercise: 'Jumping Jacks');

  setUp(() {
    repository = MockWorkoutRepository();
    streamController = StreamController<ExerciseData>.broadcast();
    when(() => repository.getExerciseDataStream())
        .thenAnswer((_) => streamController.stream);
  });

  tearDown(() async {
    await streamController.close();
  });

  blocTest<WorkoutBloc, WorkoutState>(
    'emits [loaded] when data is updated',
    build: () => WorkoutBloc(repository),
    act: (bloc) {
      bloc.add(WorkoutEvent.updated(tData));
    },
    expect: () => [WorkoutState.loaded(tData)],
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'calls resume when data is paused/stopped and PausedOrResumed is triggered',
    build: () {
      when(() => repository.resumeWorkout())
          .thenAnswer((_) async => const Response.success(null));
      return WorkoutBloc(repository);
    },
    seed: () => WorkoutState.loaded(tData.copyWith(isPaused: true)),
    act: (bloc) => bloc.add(const WorkoutEvent.pausedOrResumed()),
    verify: (_) {
      verify(() => repository.resumeWorkout()).called(1);
    },
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'calls pause when data is playing and PausedOrResumed is triggered',
    build: () {
      when(() => repository.pauseWorkout())
          .thenAnswer((_) async => const Response.success(null));
      return WorkoutBloc(repository);
    },
    seed: () => WorkoutState.loaded(tData.copyWith(isPaused: false, isStopped: false)),
    act: (bloc) => bloc.add(const WorkoutEvent.pausedOrResumed()),
    verify: (_) {
      verify(() => repository.pauseWorkout()).called(1);
    },
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'emits error when stop is called but already stopped',
    build: () => WorkoutBloc(repository),
    seed: () => WorkoutState.loaded(tData.copyWith(isStopped: true)),
    act: (bloc) => bloc.add(const WorkoutEvent.stopped()),
    expect: () => [
      WorkoutState.loaded(tData.copyWith(isStopped: true),
          errorMessage: 'Workout has already stopped'),
    ],
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'calls stopWorkout if not already stopped',
    build: () {
      when(() => repository.stopWorkout())
          .thenAnswer((_) async => const Response.success(null));
      return WorkoutBloc(repository);
    },
    seed: () => WorkoutState.loaded(tData.copyWith(isPaused: false, isStopped: false)),
    act: (bloc) => bloc.add(const WorkoutEvent.stopped()),
    verify: (_) => verify(() => repository.stopWorkout()).called(1),
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'calls nextExercise and does not emit error',
    build: () {
      when(() => repository.nextExercise())
          .thenAnswer((_) async => const Response.success(null));
      return WorkoutBloc(repository);
    },
    act: (bloc) => bloc.add(const WorkoutEvent.nextExercise()),
    verify: (_) => verify(() => repository.nextExercise()).called(1),
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'calls previousExercise and does not emit error',
    build: () {
      when(() => repository.previousExercise())
          .thenAnswer((_) async => const Response.success(null));
      return WorkoutBloc(repository);
    },
    act: (bloc) => bloc.add(const WorkoutEvent.previousExercise()),
    verify: (_) => verify(() => repository.previousExercise()).called(1),
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'emits errorMessage if repository fails',
    build: () {
      when(() => repository.pauseWorkout()).thenAnswer((_) async =>
          Response.error(DataError.message('Something went wrong')));
      return WorkoutBloc(repository);
    },
    seed: () => WorkoutState.loaded(tData),
    act: (bloc) => bloc.add(const WorkoutEvent.paused()),
    expect: () => [
      WorkoutState.loaded(tData, errorMessage: 'Something went wrong')
    ],
  );

  blocTest<WorkoutBloc, WorkoutState>(
    'clears error message on ResetError',
    build: () => WorkoutBloc(repository),
    seed: () => WorkoutState.loaded(tData, errorMessage: 'Some error'),
    act: (bloc) => bloc.add(const WorkoutEvent.resetError()),
    expect: () => [WorkoutState.loaded(tData)],
  );
}
