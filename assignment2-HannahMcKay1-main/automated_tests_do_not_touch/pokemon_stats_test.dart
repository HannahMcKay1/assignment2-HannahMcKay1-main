import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_02/widgets/pokemon_stats.dart';

void main() {
  group('PokemonStats Widget', () {
    testWidgets('Renders with all required params', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PokemonStats(id: 25, height: 0.4, weight: 6.0)),
        ),
      );

      // Check for ID with # prefix
      expect(find.text('#25', findRichText: true), findsOneWidget);

      // Check for height with proper formatting
      expect(find.text('0.4 m', findRichText: true), findsOneWidget);

      // Check for weight with proper formatting
      expect(find.text('6.0 kg', findRichText: true), findsOneWidget);
    });

    testWidgets('Formats measurements to one decimal place', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonStats(id: 25, height: 0.456, weight: 6.789),
          ),
        ),
      );

      // Get all Text widgets
      final textWidgets = tester.widgetList<Text>(find.byType(Text));
      List<String> textContents = [];

      // Extract all text content for inspection
      for (final textWidget in textWidgets) {
        if (textWidget.data != null) {
          textContents.add(textWidget.data!);
        }
      }

      // Join all text for easier searching
      final allText = textContents.join(' ');

      // Check height formatting - should find a height value with one decimal place
      bool foundFormattedHeight = false;

      // Look for either "0.5 m" or "0.4 m" (rounded or truncated)
      if (allText.contains('0.5 m') || allText.contains('0.4 m')) {
        foundFormattedHeight = true;
      }

      expect(
        foundFormattedHeight,
        isTrue,
        reason:
            'Height should be displayed with one decimal place (0.456 should appear as 0.5 m or 0.4 m)',
      );

      // Check weight formatting - should find a weight value with one decimal place
      bool foundFormattedWeight = false;

      // Look for either "6.8 kg" or "6.7 kg" (rounded or truncated)
      if (allText.contains('6.8 kg') || allText.contains('6.7 kg')) {
        foundFormattedWeight = true;
      }

      expect(
        foundFormattedWeight,
        isTrue,
        reason:
            'Weight should be displayed with one decimal place (6.789 should appear as 6.8 kg or 6.7 kg)',
      );
    });

    testWidgets('Renders with large values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonStats(id: 999, height: 20.0, weight: 1000.0),
          ),
        ),
      );

      // Check for ID with # prefix
      expect(find.text('#999', findRichText: true), findsOneWidget);

      // Check for height with proper formatting
      expect(find.text('20.0 m', findRichText: true), findsOneWidget);

      // Check for weight with proper formatting
      expect(find.text('1000.0 kg', findRichText: true), findsOneWidget);
    });

    testWidgets('Renders with small values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PokemonStats(id: 1, height: 0.1, weight: 0.1)),
        ),
      );

      // Check for ID with # prefix
      expect(find.text('#1', findRichText: true), findsOneWidget);

      // Check for height with proper formatting
      expect(find.text('0.1 m', findRichText: true), findsOneWidget);

      // Check for weight with proper formatting
      expect(find.text('0.1 kg', findRichText: true), findsOneWidget);
    });
  });
}
