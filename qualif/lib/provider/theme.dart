import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.redAccent[700],
    secondaryHeaderColor: Colors.black,
    accentColor: Colors.white,
  );

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    secondaryHeaderColor: Colors.redAccent[700],
    accentColor: Colors.white,
  );

  ThemeProvider({required bool isLight}) {
    _selectedTheme = isLight ? light : dark;
  }

  void changeTheme() {
    _selectedTheme = _selectedTheme == light ? dark : light;
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
