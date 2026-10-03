import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:localization_flutter_project/main.dart';

void main() {
  testWidgets('Localization App Smoke Test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(MyApp(Locale("en")));

    // Verify app loads
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify homepage loads
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
