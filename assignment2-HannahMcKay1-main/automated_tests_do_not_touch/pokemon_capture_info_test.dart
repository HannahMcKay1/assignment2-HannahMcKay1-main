import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_02/widgets/pokemon_capture_info.dart';
import 'package:intl/intl.dart';

void main() {
  group('PokemonCaptureInfo Widget', () {
    final testDate = DateTime.parse('2025-05-15 12:00:00');
    final formattedDate = DateFormat(
      'MMM d, yyyy',
    ).format(testDate); // "May 15, 2025"
    final baseExperience = 112;

    testWidgets('Renders with all required params', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonCaptureInfo(
              captureDate: testDate,
              baseExperience: baseExperience,
            ),
          ),
        ),
      );

      // Check for capture date
      expect(
        find.text('Capture Date: $formattedDate', findRichText: true),
        findsOneWidget,
      );

      // Check that base experience is not initially displayed
      expect(
        find.text('Base XP: $baseExperience', findRichText: true),
        findsNothing,
      );
    });

    testWidgets('Toggles base experience info when tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonCaptureInfo(
              captureDate: testDate,
              baseExperience: baseExperience,
            ),
          ),
        ),
      );

      // Verify base experience is not initially displayed
      expect(
        find.text('Base XP: $baseExperience', findRichText: true),
        findsNothing,
      );

      // Tap to show base experience - using a more specific finder
      final captureInfoText = find.text('Capture Date: $formattedDate');
      expect(captureInfoText, findsOneWidget);
      await tester.tap(captureInfoText);
      await tester.pumpAndSettle();

      // Verify base experience is now displayed
      expect(
        find.text('Base XP: $baseExperience', findRichText: true),
        findsOneWidget,
      );

      // Tap again to hide base experience
      final baseXpText = find.text('Base XP: $baseExperience');
      expect(baseXpText, findsOneWidget);
      await tester.tap(baseXpText);
      await tester.pumpAndSettle();

      // Verify base experience is hidden again
      expect(
        find.text('Base XP: $baseExperience', findRichText: true),
        findsNothing,
      );
    });

    testWidgets('Formats capture date correctly', (WidgetTester tester) async {
      // Test with different dates to ensure formatting works correctly
      final testDates = [
        DateTime.parse('2025-01-01 12:00:00'), // Jan 1, 2025
        DateTime.parse('2025-02-15 12:00:00'), // Feb 15, 2025
        DateTime.parse('2025-12-31 12:00:00'), // Dec 31, 2025
      ];

      for (final date in testDates) {
        final expectedFormat = DateFormat('MMM d, yyyy').format(date);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PokemonCaptureInfo(
                captureDate: date,
                baseExperience: baseExperience,
              ),
            ),
          ),
        );

        // Check for correctly formatted date
        expect(
          find.text('Capture Date: $expectedFormat', findRichText: true),
          findsOneWidget,
        );

        // Reset for next test
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Works with different baseExperience values', (
      WidgetTester tester,
    ) async {
      // Test with different baseExperience values
      final testExperiences = [1];

      for (final exp in testExperiences) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PokemonCaptureInfo(
                captureDate: testDate,
                baseExperience: exp,
              ),
            ),
          ),
        );

        // Tap to display base experience - using the capture date text for tapping
        final captureInfoText = find.text('Capture Date: $formattedDate');
        expect(captureInfoText, findsOneWidget);
        await tester.tap(captureInfoText);
        await tester.pumpAndSettle();

        // Check for correctly displayed base experience
        expect(find.text('Base XP: $exp', findRichText: true), findsOneWidget);
      }
    });
  });
}
