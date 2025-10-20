# Internationalization (i18n) Setup

This Flutter app now supports multiple languages using the `flutter_i18n` package.

## Supported Languages

- 🇺🇸 English (`en`)
- 🇪🇸 Spanish (`es`)

## File Structure

```
assets/
  flutter_i18n/
    en.json    # English translations
    es.json    # Spanish translations
```

## How It Works

1. **Translation Files**: All text strings are stored in JSON files in `assets/flutter_i18n/`
2. **Language Selection**: Users can change language from Settings screen
3. **Persistence**: Selected language is saved using `shared_preferences`
4. **Dynamic Updates**: Language changes apply immediately without restarting the app

## Using Translations in Code

Import the package:
```dart
import 'package:flutter_i18n/flutter_i18n.dart';
```

Translate a string:
```dart
FlutterI18n.translate(context, "app.title")
```

## Adding a New Language

1. Create a new JSON file in `assets/flutter_i18n/` (e.g., `fr.json` for French)
2. Copy the structure from `en.json` and translate all values
3. Add the locale to `supportedLocales` in `main.dart`:
```dart
supportedLocales: [
  Locale('en'),
  Locale('es'),
  Locale('fr'),  // Add new language
],
```
4. Update the language selector in `settings_screen_i18n.dart`

## Translation Keys Structure

```json
{
  "app": {
    "title": "App Title",
    "subtitle": "App Subtitle"
  },
  "onboarding": {
    "skip": "Skip button text",
    ...
  },
  "navigation": {
    "pokedex": "Tab label",
    ...
  },
  ...
}
```

## Examples

**Splash Screen:**
```dart
Text(FlutterI18n.translate(context, "app.title"))
// English: "PokéDex"
// Spanish: "PokéDex"
```

**Settings:**
```dart
Text(FlutterI18n.translate(context, "settings.language"))
// English: "Language"
// Spanish: "Idioma"
```

## Features

- ✅ Language switcher in Settings
- ✅ Persistent language preference
- ✅ Instant language updates
- ✅ Fallback to English if translation missing
- ✅ All UI text translated
- ✅ Support for more languages easily added

## Testing Different Languages

1. Open the app
2. Go to Settings tab
3. Tap on "Language" / "Idioma"
4. Select your preferred language
5. The app will update immediately!