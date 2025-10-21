import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Mock simple de traducciones para tests
class MockI18n {
  static final Map<String, Map<String, String>> _translations = {
    'en': {
      // Pokemon Detail
      'pokemon_detail.height': 'Height',
      'pokemon_detail.weight': 'Weight',
      'pokemon_detail.abilities': 'Abilities',
      'pokemon_detail.base_stats': 'Base Stats',
      'pokemon_detail.hp': 'HP',
      'pokemon_detail.attack': 'Attack',
      'pokemon_detail.defense': 'Defense',
      'pokemon_detail.sp_attack': 'Sp. Atk',
      'pokemon_detail.sp_defense': 'Sp. Def',
      'pokemon_detail.speed': 'Speed',

      // Pokemon List
      'pokemon_list.error_title': 'Something went wrong...',
      'pokemon_list.error_description': 'We were unable to load the data',
      'pokemon_list.retry': 'Retry',
      'pokemon_list.found': ' found ',
      'pokemon_list.results': ' results',
      'pokemon_list.clean_filter': 'Clean filter',
      'pokemon_list.search': 'Find Pokemon...',

      // Favorites
      'favorites.title': 'Favorites',
      'favorites.no_favorites':
          'You have not selected any Pokemon as favorites',
      'favorites.add_favorites': 'Click the heart icon',
    },
    'es': {
      // Pokemon Detail
      'pokemon_detail.height': 'Altura',
      'pokemon_detail.weight': 'Peso',
      'pokemon_detail.abilities': 'Habilidades',
      'pokemon_detail.base_stats': 'Estadísticas Base',
      'pokemon_detail.hp': 'PS',
      'pokemon_detail.attack': 'Ataque',
      'pokemon_detail.defense': 'Defensa',
      'pokemon_detail.sp_attack': 'At. esp.',
      'pokemon_detail.sp_defense': 'Def. esp.',
      'pokemon_detail.speed': 'Velocidad',

      // Pokemon List
      'pokemon_list.error_title': 'Algo salió mal...',
      'pokemon_list.error_description': 'No pudimos cargar la información',
      'pokemon_list.retry': 'Reintentar',
      'pokemon_list.found': 'Se han encontrado ',
      'pokemon_list.results': 'resultados ',
      'pokemon_list.clean_filter': 'Borrar filtro',
      'pokemon_list.search': 'Procurar Pokémon...',

      // Favorites
      'favorites.title': 'Favoritos',
      'favorites.no_favorites': 'No has marcado ningún Pokémon como favorito',
      'favorites.add_favorites': 'Haz clic en el ícono de corazón',
    },
  };

  /// Obtiene una traducción
  static String translate(String key, {String locale = 'en'}) {
    return _translations[locale]?[key] ?? key;
  }
}

/// Widget de localización simple para tests
class SimpleLocalization {
  final Locale locale;
  final Map<String, String> _translations;

  SimpleLocalization(this.locale)
    : _translations = MockI18n._translations[locale.languageCode] ?? {};

  static SimpleLocalization of(BuildContext context) {
    return Localizations.of<SimpleLocalization>(context, SimpleLocalization)!;
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }
}

/// Delegate para SimpleLocalization
class SimpleLocalizationDelegate
    extends LocalizationsDelegate<SimpleLocalization> {
  const SimpleLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<SimpleLocalization> load(Locale locale) async {
    return SimpleLocalization(locale);
  }

  @override
  bool shouldReload(SimpleLocalizationDelegate old) => false;
}

/// Función helper para crear un widget testeable SIN i18n
/// Esta es la opción MÁS SIMPLE - solo MaterialApp básico
Widget createBasicTestWidget(Widget child) {
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      home: child,
    ),
  );
}
