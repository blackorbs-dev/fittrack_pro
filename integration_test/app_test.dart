import 'package:fittrack_pro/features/dashboard/presentation/widgets/custom_chart.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/morphing_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fittrack_pro/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('test dashboard to fro workout session page', (tester) async {
      await runAppTest(tester);
    });
  });
}

Future<void> runAppTest(WidgetTester tester)async{
  app.main(); // launches the app
  await tester.pump();

  // Wait for Dashboard to load
  expect(find.text('Listening for active workout session...'), findsOneWidget);

  await tester.tap(find.byType(MorphingFab));
  await tester.pump();
  await tester.tap(find.text('Start'));
  await tester.pump(Duration(seconds: 1));

  expect(find.textContaining('Welcome Jamiu'), findsOneWidget);
  expect(find.text('Workout Progress'), findsOneWidget);
  expect(find.byType(LineChart), findsOneWidget);

  await tester.dragUntilVisible(find.text('Quick Actions'), find.byType(CustomScrollView).first, Offset(0, -700));
  await tester.pump();
  await tester.tap(find.text('Start Workout'));
  await tester.pump(Duration(seconds: 1));
  expect(find.text('Workout already in progress'), findsOneWidget);
  await tester.pump(Duration(seconds: 2));

  await tester.tap(find.text('Track Progress'));
  await tester.pump(Duration(seconds: 3));

  expect(find.text('HIIT Training'), findsOneWidget);
  expect(find.text('Time Remaining'), findsOneWidget);

  await tester.pump(Duration(seconds: 1));
  await tester.tap(find.byIcon(Icons.pause_rounded));
  await tester.pump(Duration(seconds: 2));
  expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);

  await tester.tap(find.byIcon(Icons.stop_rounded));
  await tester.pump(Duration(seconds: 2));
  expect(find.text('Workout has already stopped'), findsOneWidget);

  await tester.pump(Duration(seconds: 2));
  await tester.tap(find.backButton());
  await tester.pump(Duration(seconds: 2));
  expect(find.text('Quick Actions'), findsOneWidget);
}
