import 'package:flutter/material.dart';
import 'package:localization_flutter_project/l10n/app_localizations.dart';
import 'package:localization_flutter_project/pages/home_page.dart';
import 'package:localization_flutter_project/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Load saved language
  Locale savedLocale = await AppProvider.loadLanguage();

  runApp(MyApp(savedLocale));
}

class MyApp extends StatefulWidget {
  // Store saved locale
  final Locale locale;

  const MyApp(this.locale, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider(widget.locale)),
      ],

      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),

              // useMaterial3: true,
            ),

            // Current App Locale
            locale: provider.locale,

            debugShowCheckedModeBanner: false,

            title: 'Flutter Localization App',

            // Localization delegates
            localizationsDelegates: AppLocalizations.localizationsDelegates,

            // Supported languages
            supportedLocales: AppLocalizations.supportedLocales,

            home: const HomePage(),
          );
        },
      ),
    );
  }
}
