import 'package:assignment_02/widgets/pokemon_capture_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_02/pages/pokemon_detail_view.dart';
import 'package:assignment_02/models/pokemon.dart';

void main() {
  late Widget widgetToTest;

  // Test data
  final testPokemon = Pokemon(
    name: 'pikachu',
    id: 25,
    height: 0.4,
    weight: 6.0,
    baseExperience: 112,
    types: ['electric'],
    captureDate: DateTime.parse('2025-05-15 12:00:00'),
  );

  Future<Pokemon> mockPokemonProvider({String name = 'pikachu'}) async {
    return testPokemon;
  }

  group('PokemonDetailView Widget', () {
    setUp(() {
      widgetToTest = MaterialApp(
        home: PokemonDetailView(pokemonProvider: mockPokemonProvider),
      );
    });

    testWidgets('Renders the Pokemon name', (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.pumpAndSettle();

      expect(
        find.textContaining('pikachu', findRichText: true),
        findsOneWidget,
        reason:
            'Should find Pokemon name "pikachu" displayed somewhere in the UI',
      );
    });

    testWidgets('Renders the Pokemon types', (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.pumpAndSettle();

      // The type might be displayed in various formats, so we'll look for it with some flexibility
      expect(
        find.textContaining(
          RegExp('electric', caseSensitive: false),
          findRichText: true,
        ),
        findsOneWidget,
        reason:
            'Should find Pokemon type "electric" displayed somewhere in the UI',
      );
    });

    testWidgets('Renders the PokemonStats widget', (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.pumpAndSettle();

      // Check for ID display with '#' prefix
      expect(find.text('#25', findRichText: true), findsOneWidget);

      // Check for height display
      expect(find.text('0.4 m', findRichText: true), findsOneWidget);

      // Check for weight display
      expect(find.text('6.0 kg', findRichText: true), findsOneWidget);
    });

    testWidgets('Renders the PokemonCaptureInfo widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(widgetToTest);
      await tester.pumpAndSettle();

      expect(
        find.byType(PokemonCaptureInfo),
        findsOneWidget,
        reason: 'Should render a PokemonCaptureInfo widget',
      );
    });

    testWidgets('Renders at least one local asset image', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(widgetToTest);
      await tester.pumpAndSettle();

      // Check for Image widget
      expect(find.byType(Image), findsAtLeastNWidgets(1));
    });

    testWidgets('Renders a button to fetch Pokemon data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(widgetToTest);
      await tester.pumpAndSettle();

      // Looking for any type of button
      final hasElevatedButton =
          find.byType(ElevatedButton).evaluate().isNotEmpty;
      final hasTextButton = find.byType(TextButton).evaluate().isNotEmpty;
      final hasOutlinedButton =
          find.byType(OutlinedButton).evaluate().isNotEmpty;
      final hasIconButton = find.byType(IconButton).evaluate().isNotEmpty;

      expect(
        hasElevatedButton ||
            hasTextButton ||
            hasOutlinedButton ||
            hasIconButton,
        isTrue,
        reason:
            'Should find at least one button widget for fetching Pokemon data',
      );
    });

    testWidgets(
      'Cycles through a list of Pokemon names when button is tapped',
      (WidgetTester tester) async {
        var calls = 0;
        List<String> seenNames = [];

        // Create a mock provider that returns different Pokemon on each call
        Future<Pokemon> cyclePokemonProvider({String name = 'pikachu'}) async {
          calls += 1;
          seenNames.add(name);

          return Pokemon(
            name: name,
            id: 25 + calls,
            height: 0.4 + (calls * 0.1),
            weight: 6.0 + (calls * 1.0),
            baseExperience: 112 + (calls * 10),
            types:
                calls == 1
                    ? ['electric']
                    : calls == 2
                    ? ['grass', 'poison']
                    : calls == 3
                    ? ['fire']
                    : ['water'],
            captureDate: DateTime.parse('2025-05-15 12:00:00'),
          );
        }

        // Build widget with our cycling provider
        await tester.pumpWidget(
          MaterialApp(
            home: PokemonDetailView(pokemonProvider: cyclePokemonProvider),
          ),
        );

        await tester.pumpAndSettle();
        expect(calls, 1); // Initial load

        // Find the button to cycle through Pokemon
        final buttonFinder = find.byType(ElevatedButton);
        if (buttonFinder.evaluate().isEmpty) {
          // Try other button types if ElevatedButton isn't found
          final textButtonFinder = find.byType(TextButton);
          final outlinedButtonFinder = find.byType(OutlinedButton);
          final iconButtonFinder = find.byType(IconButton);

          final effectiveButtonFinder =
              textButtonFinder.evaluate().isNotEmpty
                  ? textButtonFinder
                  : outlinedButtonFinder.evaluate().isNotEmpty
                  ? outlinedButtonFinder
                  : iconButtonFinder;

          // Verify we found at least one button
          expect(
            effectiveButtonFinder,
            findsAtLeastNWidgets(1),
            reason: 'Should find at least one button to tap',
          );

          // Tap the button to load the next Pokemon
          await tester.tap(effectiveButtonFinder.first);
        } else {
          // Use the ElevatedButton we found
          await tester.tap(buttonFinder.first);
        }

        await tester.pumpAndSettle();
        expect(calls, 2); // Should have made a second call

        // Tap again to get to the third Pokemon
        await tester.tap(find.byType(ElevatedButton).first);
        await tester.pumpAndSettle();
        expect(calls, 3); // Should have made a third call

        expect(
          seenNames.toSet().length >= 3,
          isTrue,
          reason: 'Should cycle through at least 3 different Pokemon names',
        );
      },
    );
  });
}
