import 'package:flutter/material.dart';

import '../../Utilities/shared_preferences.dart';
import 'theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  Color? _primaryColor, _secondaryColor;

  Color? get primaryColor => _primaryColor;
  Color? get secondaryColor => _secondaryColor;

  ThemeModel _appTheme = ThemeModel.defaultTheme;
  ThemeModel get appTheme => _appTheme.copyWith(
      primaryColor: _primaryColor,
      pTint1: _primaryColor?.withOpacity(0.5),
      pTint2: _primaryColor?.withOpacity(0.4),
      secondary: _secondaryColor,
      sTint1: _secondaryColor?.withOpacity(0.75),
      sTint2: _secondaryColor?.withOpacity(0.5),
  );

  void fetchTheme() {
    _primaryColor = SharedPref.getPrimaryColor();
    _secondaryColor = SharedPref.getSecondaryColor();
    if (SharedPref.getTheme() == null) {
      _appTheme = ThemeModel.defaultTheme;
    } else {
      _appTheme = SharedPref.getTheme()!;
    }
  }

  ThemeData? get appThemeMode => _appTheme.isDark ? _darkMode : _lightMode;

  ThemeData get _darkMode => ThemeData.dark(useMaterial3: false).copyWith(extensions: <ThemeExtension<ThemeModel>>[
        _appTheme,
      ]);
  ThemeData get _lightMode => ThemeData.light(useMaterial3: false).copyWith(extensions: <ThemeExtension<ThemeModel>>[
        _appTheme,
      ]);

  Future changeTheme({required ThemeModel theme}) async {
    _appTheme = theme;
    await SharedPref.setTheme(theme: _appTheme);
    notifyListeners();
  }

  Future changePrimaryColor({required Color color}) async {
    _primaryColor = color;
    await SharedPref.setPrimaryColor(color: color);
    notifyListeners();
  }

  Future changeSecondaryColor({required Color color}) async {
    _secondaryColor = color;
    await SharedPref.setSecondaryColor(color: color);
    notifyListeners();
  }
}
