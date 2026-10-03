import 'package:flutter/material.dart';
import 'package:localization_flutter_project/l10n/app_localizations.dart';
import 'package:localization_flutter_project/provider/app_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Language { english, urdu }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarTitle),

        centerTitle: true,

        actions: [
          PopupMenuButton<Language>(
            onSelected: (Language value) {
              final provider = context.read<AppProvider>();

              if (value == Language.english) {
                provider.changeLanguage(Locale("en"));
              } else {
                provider.changeLanguage(Locale("ur"));
              }
            },

            itemBuilder: (context) => [
              PopupMenuItem(value: Language.english, child: Text("English")),

              PopupMenuItem(value: Language.urdu, child: Text("Urdu")),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.bodyMessage,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              final Provider = context.read<AppProvider>();
              if (AppLocalizations.of(context)!.localeName == ("ur")) {
                Provider.changeLanguage(Locale("en"));
              } else {
                Provider.changeLanguage(Locale("ur"));
              }
            },
            child: Text(AppLocalizations.of(context)!.changeLanguage),
          ),
        ],
      ),
    );
  }
}
