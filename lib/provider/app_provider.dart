import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  Locale locale;

  AppProvider(this.locale);

  // Change Language
  Future<void> changeLanguage(Locale value) async {
    locale = value;

    // SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save language code
    await prefs.setString("languageCode", value.languageCode);

    notifyListeners();
  }

  // Load saved language
  static Future<Locale> loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? code = prefs.getString("languageCode");

    // If language already saved
    if (code != null) {
      return Locale(code);
    }

    // Default language
    return Locale("en");
  }
}
