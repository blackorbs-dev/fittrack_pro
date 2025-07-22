import 'package:bloc_test/bloc_test.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_bloc.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_event.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_state.dart';
import 'package:fittrack_pro/features/workout/presentation/widgets/bottom_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../util/mock_instances.dart';

class MockWorkoutBloc extends Mock implements WorkoutBloc {}

void main() {
  late WorkoutBloc bloc;

  setUp(() {
    bloc = MockWorkoutBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<WorkoutBloc>.value(
          value: bloc,
          child: widget,
        ),
      ),
    );
  }

  testWidgets('taps dispatch correct WorkoutEvents', (tester) async {
    // Mock the selector to show play icon
    when(() => bloc.state).thenReturn(
      WorkoutState.loaded(exerciseData()),
    );
    whenListen(bloc, Stream<WorkoutState>.empty());

    await tester.pumpWidget(buildTestableWidget(const BottomControls()));

    // Tap previous button
    await tester.tap(find.byIcon(Icons.skip_previous_rounded));
    verify(() => bloc.add(const WorkoutEvent.previousExercise())).called(1);

    // Tap pause/play button
    await tester.tap(find.byIcon(Icons.play_arrow_rounded));
    verify(() => bloc.add(const WorkoutEvent.pausedOrResumed())).called(1);

    // Tap next button
    await tester.tap(find.byIcon(Icons.skip_next_rounded));
    verify(() => bloc.add(const WorkoutEvent.nextExercise())).called(1);

    // Tap stop button
    await tester.tap(find.byIcon(Icons.stop_rounded));
    verify(() => bloc.add(const WorkoutEvent.stopped())).called(1);
  });
}
