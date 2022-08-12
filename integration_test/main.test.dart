import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tmdb/main.dart' as app;

void main() {
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

 Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

  group('end-to-end test', () {
    
    testWidgets('Navigate though the 2 pages.',

        (tester) async {
      app.main();

      await tester.pumpAndSettle();

      await addDelay(1000);

      expect(find.text('Popular People'), findsOneWidget);

      tester.printToConsole('Home Page');

      await tester.tap(find.byKey(const ValueKey('tap_1')));

      tester.printToConsole('Detail Page');

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0.0, 200.0));

      await tester.tap(find.byKey(const ValueKey('tap_1'),));

      await addDelay(4000);

      // Trigger a frame.
      await tester.pumpAndSettle();
    });
  });
}