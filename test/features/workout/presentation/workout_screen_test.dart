import 'package:fittrack_pro/features/dashboard/presentation/widgets/spinning_arc.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_bloc.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_event.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_state.dart';
import 'package:fittrack_pro/features/workout/presentation/pages/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../util/mock_response.dart';

class MockWorkoutBloc extends Mock implements WorkoutBloc {}

void main() {
  late WorkoutBloc workoutBloc;

  final testData = exerciseData(
    id: 'test123',
    currentExercise: 'Push Ups',
    currentExerciseNumber: 2,
    totalExercises: 5,
    timeRemaining: 90,
    heartRate: 80,
  );

  setUp(() {
    workoutBloc = MockWorkoutBloc();
    registerFallbackValue(WorkoutEvent.started());
    when(() => workoutBloc.stream).thenAnswer((_) => const Stream<WorkoutState>.empty());
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<WorkoutBloc>.value(
        value: workoutBloc,
        child: child,
      ),
    );
  }

  testWidgets('displays LoadingBox on initial state', (tester) async {
    when(() => workoutBloc.state).thenReturn(const WorkoutState.initial());
    await tester.pumpWidget(makeTestableWidget(const WorkoutView()));

    expect(find.byType(SpinningArc), findsOneWidget);
    expect(find.text('Listening for active workout session...'), findsOneWidget);
  });

  testWidgets('displays exercise UI on Loaded state', (tester) async {
    when(() => workoutBloc.state).thenReturn(WorkoutState.loaded(testData));
    await tester.pumpWidget(makeTestableWidget(const WorkoutView()));

    expect(find.text('Push Ups'), findsOneWidget);
    expect(find.textContaining('Set 2 of 5'), findsOneWidget);
    expect(find.text('Time Remaining'), findsOneWidget);
  });

  testWidgets('swipe left sends nextExercise event', (tester) async {
    when(() => workoutBloc.state).thenReturn(WorkoutState.loaded(testData));
    when(() => workoutBloc.add(any())).thenAnswer((_) {});

    await tester.pumpWidget(makeTestableWidget(const WorkoutView()));

    await tester.flingFrom(const Offset(300, 300), const Offset(-200, 0),400);
    verify(() => workoutBloc.add(const WorkoutEvent.nextExercise())).called(1);
  });

  testWidgets('swipe right sends previousExercise event', (tester) async {
    when(() => workoutBloc.state).thenReturn(WorkoutState.loaded(testData));
    when(() => workoutBloc.add(any())).thenAnswer((_) {});

    await tester.pumpWidget(makeTestableWidget(const WorkoutView()));

    await tester.flingFrom(const Offset(100, 300), const Offset(200, 0),400);

    verify(() => workoutBloc.add(const WorkoutEvent.previousExercise())).called(1);
  });

  testWidgets('swipe down sends paused event', (tester) async {
    when(() => workoutBloc.state).thenReturn(WorkoutState.loaded(testData));
    when(() => workoutBloc.add(any())).thenAnswer((_) {});

    await tester.pumpWidget(makeTestableWidget(const WorkoutView()));

    await tester.flingFrom(const Offset(300, 300), const Offset(0, 200),400);

    verify(() => workoutBloc.add(const WorkoutEvent.paused())).called(1);
  });

  testWidgets('swipe up sends resumed event', (tester) async {
    when(() => workoutBloc.state).thenReturn(WorkoutState.loaded(testData));
    when(() => workoutBloc.add(any())).thenAnswer((_) {});

    await tester.pumpWidget(makeTestableWidget(const WorkoutView()));

    await tester.flingFrom(const Offset(300, 500), const Offset(0, -200),400);

    verify(() => workoutBloc.add(const WorkoutEvent.resumed())).called(1);
  });
}
