import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global66/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _SettingsState();
}

class _SettingsState extends State<Profile> {
  String _currentLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('language') ?? 'en';
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);

    final newLocale = Locale(languageCode);
    await FlutterI18n.refresh(context, newLocale);

    setState(() {
      _currentLanguage = languageCode;
    });

    // Update the app's locale to trigger full rebuild
    if (mounted) {
      MyApp.setLocale(context, newLocale);
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(FlutterI18n.translate(context, "settings.language")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text('English'),
                value: 'en',
                groupValue: _currentLanguage,
                onChanged: (value) {
                  if (value != null) {
                    _changeLanguage(value);
                    Navigator.pop(context);
                  }
                },
              ),
              RadioListTile<String>(
                title: Text('Español'),
                value: 'es',
                groupValue: _currentLanguage,
                onChanged: (value) {
                  if (value != null) {
                    _changeLanguage(value);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text(FlutterI18n.translate(context, "settings.language")),
            subtitle: Text(_currentLanguage == 'en' ? 'English' : 'Español'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: _showLanguageDialog,
          ),
        ],
      ),
    );
  }
}
