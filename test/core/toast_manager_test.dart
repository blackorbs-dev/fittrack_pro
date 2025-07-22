import 'package:fittrack_pro/core/service/toast_manager.dart';
import 'package:fittrack_pro/features/shared/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ToastManager shows and auto-dismisses toast', (WidgetTester tester) async {
    // Scaffold to host overlay
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    ToastManager().show(context, 'Hello World');
                  },
                  child: Text('Show Toast'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tap the button to show toast
    await tester.tap(find.text('Show Toast'));
    await tester.pump(); // Rebuild after tap

    // Expect the ToastCard to appear
    expect(find.byType(ToastCard), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);

    // Fast-forward 3 seconds + animation delay
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(milliseconds: 100)); // cleanup delay

    // ToastCard should be removed
    expect(find.byType(ToastCard), findsNothing);
  });
}
