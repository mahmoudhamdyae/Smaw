import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smaw/main_screen.dart';

import 'core/app/app_preferences.dart';
import 'core/di/di.dart';
import 'core/resources/language_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  @override
  void initState() {
    super.initState();
    setState(() {
      _locale = instance.get<AppPreferences>().getAppLanguage()
          == english ? englishLocal : arabicLocal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [englishLocal, arabicLocal],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: _locale,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'Smaw',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

