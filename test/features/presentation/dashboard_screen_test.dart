import 'package:fittrack_pro/features/dashboard/domain/models/chart_type.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/data_point.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/workout_stats.dart';
import 'package:fittrack_pro/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fittrack_pro/features/dashboard/presentation/pages/dashboard.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/custom_chart.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/morphing_fab.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/spinning_arc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardCubit extends Mock implements DashboardCubit {}

void main() {
  late DashboardCubit mockCubit;

  final testStats = WorkoutStats(
    totalWorkouts: 12,
    totalCaloriesBurned: 900,
    totalDuration: const Duration(minutes: 130),
    averageHeartRate: 115,
    lastUpdated: DateTime(2024, 6, 1, 12, 30),
    chartData: {
      ChartType.heartRate: [DataPoint(time: DateTime.now(), value: 100)],
      ChartType.calories: [DataPoint(time: DateTime.now(), value: 500)],
    },
  );

  setUp(() {
    mockCubit = MockDashboardCubit();
    registerFallbackValue(DashboardState.initial());
    when(() => mockCubit.stream).thenAnswer((_) => const Stream<DashboardState>.empty());
  });

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<DashboardCubit>.value(
        value: mockCubit,
        child: child,
      ),
    );
  }

  testWidgets('Shows loading on start', (tester) async {
    when(() => mockCubit.state).thenReturn(DashboardState.initial());
    await tester.pumpWidget(buildTestableWidget(const DashboardView()));

    expect(find.byType(SpinningArc), findsOneWidget);
    expect(find.text('Listening for active workout session...'), findsOneWidget);
  });

  testWidgets('renders Dashboard with stat cards and chart', (tester) async {
    when(() => mockCubit.state).thenReturn(DashboardState.loaded(
      workoutStats: testStats,
      selectedChart: ChartType.heartRate,
    ));

    await tester.pumpWidget(buildTestableWidget(const DashboardView()));

    expect(find.text('Workouts'), findsOneWidget);
    expect(find.text('Calories'), findsNWidgets(2));
    expect(find.text('Active Minutes'), findsOneWidget);
    expect(find.text('Avg Heart Rate'), findsOneWidget);
    expect(find.text('Workout Progress'), findsOneWidget);
    await tester.dragUntilVisible(find.text('Quick Actions'), find.byType(CustomScrollView).first, Offset(0, -600));
    expect(find.text('Quick Actions'), findsOneWidget);
  });

  testWidgets('Start Workout triggers cubit method', (tester) async {
    when(() => mockCubit.state).thenReturn(DashboardState.loaded(
      workoutStats: testStats,
      selectedChart: ChartType.heartRate,
    ));

    await tester.pumpWidget(buildTestableWidget(const DashboardView()));
    await tester.dragUntilVisible(find.text('Quick Actions'), find.byType(CustomScrollView).first, Offset(0, -700));
    await tester.tap(find.text('Start Workout'));
    verify(() => mockCubit.startWorkout()).called(1);
  });

  testWidgets('MorphingFab changes state on tap', (tester) async {
    when(() => mockCubit.state).thenReturn(DashboardState.loaded(
      workoutStats: testStats,
      selectedChart: ChartType.heartRate,
    ));

    await tester.pumpWidget(buildTestableWidget(const DashboardView()));
    expect(find.byType(MorphingFab), findsOneWidget);
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);

    await tester.tap(find.byType(MorphingFab));
    await tester.pump(Duration(seconds: 2));
    expect(find.text('Start'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });



}
