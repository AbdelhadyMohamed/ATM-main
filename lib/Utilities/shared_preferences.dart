import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../core/Font/font_provider.dart';
import '../core/Theme/theme_model.dart';
import 'git_it.dart';

class SharedPref {
  static SharedPreferences get prefs => GetIt.instance.get<SharedPreferences>();

  static const String _language = "language_code";
  static const String _currentUserKey = "currentUser";
  static const String _themeKey = "theme_key";
  static const String _fontSizeKey = "fontSize";
  static const String _fontFamilyKey = "fontFamily";
  static const String _primaryColor = "_primaryColor";
  static const String _secondaryColor = "_secondaryColor";
  static const String _intro = "intro";

  static Future<void> saveCurrentUser({required UserModel user}) async {
    GitIt.instance.registerLazySingleton<UserModel>(() => user,);
    await prefs.setString(_currentUserKey, json.encode(user.toJson()));
  }

  static UserModel? getCurrentUser() {
    if (prefs.getString(_currentUserKey) == null) return null;
    return UserModel.fromJson(json.decode(prefs.getString(_currentUserKey)!));
  }

  static bool isLogin() {
    UserModel? user = getCurrentUser();
    return user != null;
  }

  static Future logout() async {
    GitIt.instance.registerLazySingleton<UserModel>(() => UserModel(),);
    await prefs.remove(_currentUserKey);
  }

  static bool isWatchIntro()=> prefs.getBool(_intro)  == true;

  static Future<void> saveWatchIntro() async=> await prefs.setBool(_intro, true);

  static String? getLanguage() {
    return prefs.getString(_language);
  }

  static Future<void> setLanguage({required String lang}) async {
    await prefs.setString(_language, lang);
  }

  static ThemeModel? getTheme() {
    if (prefs.getString(_themeKey) == null) return null;
    return ThemeModel.fromJson(json.decode(prefs.getString(_themeKey)!));
  }

  static Future<void> setTheme({required ThemeModel theme}) async {
    await prefs.setString(_themeKey, json.encode(theme.toJson()));
  }

  static Color? getPrimaryColor() {
    if (prefs.getInt(_primaryColor) == null) return null;
    return Color(prefs.getInt(_primaryColor)!);
  }

  static Future<void> setPrimaryColor({required Color color}) async {
    await prefs.setInt(_primaryColor, color.value);
  }

  static Color? getSecondaryColor() {
    if (prefs.getInt(_secondaryColor) == null) return null;
    return Color(prefs.getInt(_secondaryColor)!);
  }

  static Future<void> setSecondaryColor({required Color color}) async {
    await prefs.setInt(_secondaryColor, color.value);
  }

  static double? getFontSizeScale() {
    return prefs.getDouble(_fontSizeKey);
  }

  static Future<void> setFontSizeScale({required double fontSizeScale}) async {
    await prefs.setDouble(_fontSizeKey, fontSizeScale);
  }

  static Future setFontFamily({required FontFamilyTypes fontFamily}) async => await prefs.setInt(_fontFamilyKey, fontFamily.index);

  static FontFamilyTypes? getFontFamily() => prefs.getInt(_fontFamilyKey) == null ? null : FontFamilyTypes.values[prefs.getInt(_fontFamilyKey)!];
}