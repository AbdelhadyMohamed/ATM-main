
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../Utilities/shared_preferences.dart';
import '../../Utilities/theme_helper.dart';


class ThemeModel extends ThemeExtension<ThemeModel>{

  static ThemeModel get defaultTheme{
    Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark? ThemeClass.darkTheme():ThemeClass.lightTheme();
  }

  final bool isDark;
  final Color background;
  final Color reversedBlackWhite;
  final Color primaryColor;
  final Color pShade1;
  final Color secondary;
  final Color shade1;
  final Color cardLight;
  final Color lightGrey;
  final Color medGrey;
  final Color darkGrey;
  final Color success;
  final Color waiting;
  final Color cancel;
  final Color informative;
  final Color textColorMain;
  final Color textColorSecondary;


  ThemeModel({
    this.isDark = false,
    required this.reversedBlackWhite,
    required this.background,
    required this.primaryColor,
    required this.pShade1,
    required this.secondary,
    required this.shade1,
    required this.cardLight,
    required this.lightGrey,
    required this.medGrey,
    required this.darkGrey,
    required this.success,
    required this.waiting,
    required this.cancel,
    required this.informative,
    required this.textColorMain,
    required this.textColorSecondary,
});

  @override
  ThemeModel copyWith({
    bool? isDark,
    Color? reversedBlackWhite,
    Color? background,
    Color? primaryColor,
    Color? pTint1,
    Color? pTint2,
    Color? pShade1,
    Color? secondary,
    Color? sTint1,
    Color? sTint2,
    Color? shade1,
    Color? cardLight,
    Color? lightGrey,
    Color? medGrey,
    Color? darkGrey,
    Color? success,
    Color? waiting,
    Color? cancel,
    Color? informative,
    Color? textColorMain,
    Color? textColorSecondary,
    Color? tabBarColor,
}) {
    return ThemeModel(
      reversedBlackWhite: reversedBlackWhite??this.reversedBlackWhite,
      isDark: isDark??this.isDark,
      background: background??this.background,
      primaryColor: primaryColor??this.primaryColor,
      pShade1: pShade1??this.pShade1,
      secondary: secondary??this.secondary,
      shade1: shade1??this.shade1,
      cardLight: cardLight??this.cardLight,
      lightGrey: lightGrey??this.lightGrey,
      medGrey: medGrey??this.medGrey,
      darkGrey: darkGrey??this.darkGrey,
      success: success??this.success,
      waiting: waiting??this.waiting,
      cancel: cancel??this.cancel,
      informative: informative??this.informative,
      textColorMain: textColorMain??this.textColorMain,
      textColorSecondary: textColorSecondary??this.textColorSecondary,
    );
  }

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
    isDark: json["isDark"],

    reversedBlackWhite: Color(json["reversedBlackWhite"]),
    background: Color(json["background"]),
    primaryColor: Color(json["primaryColor"]),
    pShade1: Color(json["pShade1"]),
    secondary: Color(json["secondary"]),
    shade1: Color(json["shade1"]),
    cardLight: Color(json["cardLight"]),
    lightGrey: Color(json["lightGrey"]),
    medGrey: Color(json["medGrey"]),
    darkGrey: Color(json["darkGrey"]),
    success: Color(json["success"]),
    waiting: Color(json["waiting"]),
    cancel: Color(json["cancel"]),
    informative: Color(json["informative"]),
    textColorMain: Color(json["textColorMain"]),
    textColorSecondary: Color(json["textColorSecondary"]),
  );

  Map<String, dynamic> toJson() => {
    "isDark": isDark,
    "reversedBlackWhite": reversedBlackWhite.value,
    "background": background.value,
    "primaryColor": primaryColor.value,
    "pShade1": pShade1.value,
    "secondary": secondary.value,
    "shade1": shade1.value,
    "cardLight": cardLight.value,
    "lightGrey": lightGrey.value,
    "medGrey": medGrey.value,
    "darkGrey": darkGrey.value,
    "success": success.value,
    "waiting": waiting.value,
    "cancel": cancel.value,
    "informative": informative.value,
    "textColorMain": textColorMain.value,
    "textColorSecondary": textColorSecondary.value,
  };


  @override
  ThemeModel lerp(ThemeExtension<ThemeModel>? other, double t) {
    if (other is! ThemeModel) {
      return this;
    }
    return SharedPref.getTheme()??defaultTheme;
  }
}