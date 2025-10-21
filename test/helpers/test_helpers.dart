import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Helper para crear un widget testeable con i18n y Riverpod
Widget createTestableWidget({
  required Widget child,
  List<Override>? overrides,
  Locale locale = const Locale('en'),
}) {
  return ProviderScope(
    overrides: overrides ?? [],
    child: MaterialApp(
      locale: locale,
      localizationsDelegates: [
        // Delegates de Flutter para soporte de Material y Cupertino
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // Delegate de i18n con NamespaceFileTranslationLoader para tests
        FlutterI18nDelegate(
          translationLoader: NamespaceFileTranslationLoader(
            useCountryCode: false,
            basePath: 'assets/flutter_i18n',
            forcedLocale: locale,
            namespaces: ['es', 'en'],
          ),
        ),
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      home: child,
    ),
  );
}

/// Helper para mockear traducciones sin archivos
class MockFlutterI18n {
  static final Map<String, String> _mockTranslations = {
    // Pokemon List
    'pokemon_list.error_title': 'Something went wrong...',
    'pokemon_list.error_description': 'We were unable to load the data',
    'pokemon_list.retry': 'Retry',
    'pokemon_list.found': ' found ',
    'pokemon_list.results': ' results',
    'pokemon_list.clean_filter': 'Clean filter',
    'pokemon_list.search': 'Find Pokemon...',

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

    // Favorites
    'favorites.title': 'Favorites',
    'favorites.no_favorites': 'You have not selected any Pokemon as favorites',
    'favorites.add_favorites': 'Click the heart icon',
  };

  static String translate(String key) {
    return _mockTranslations[key] ?? key;
  }
}

/// Extension para facilitar el pump con i18n
extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpWithI18n(
    Widget widget, {
    List<Override>? overrides,
    Locale locale = const Locale('en'),
  }) async {
    await pumpWidget(
      createTestableWidget(child: widget, overrides: overrides, locale: locale),
    );
    await pumpAndSettle();
  }
}
