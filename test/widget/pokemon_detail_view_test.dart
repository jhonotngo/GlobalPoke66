import 'package:flutter_test/flutter_test.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:global66/src/ui/pokedex/pokemon_detail_view.dart';
import '../fixtures/pokemon_fixtures.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('PokemonDetailV Widget', () {
    late Pokemon testPokemon;

    setUp(() {
      testPokemon = PokemonFixtures.pikachuWithDetails;
    });

    testWidgets('muestra el nombre del Pokemon correctamente', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWithI18n(PokemonDetailV(pokemon: testPokemon));

      // Assert
      expect(find.text('Pikachu'), findsOneWidget);
    });
  });
}
