import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // Main Colors
  final Color primary;         // #16A249
  final Color secondary;       // #F0C814
  final Color accent;          // #8B5CF6
  final Color error;           // #EC4A3A

  // Light Mode
  final Color lightBackground;       // #090A0F
  final Color lightForeground;       // #FAFAFA
  final Color lightSecondary;        // #282A32
  final Color lightMutedForeground;  // #A3A6AC
  final Color lightPrimaryForeground;// #F7F5F5

  // Dark Mode
  final Color darkBackground;        // #020817
  final Color darkForeground;        // #F8FAFC
  final Color darkSecondary;         // #1E293B
  final Color darkMutedForeground;   // #94A3B8
  final Color darkPrimaryForeground; // #0F172A
  final Color darkDestructive;       // #7F1D1D
  final Color darkRing;              // #CBD5E1

  final Color purple;
  final Color orange;
  final Color black;
  final Color black80;
  final Color grey;
  final Color green;
  final Color greenDeep60;
  final Color greenDeep;
  final Color pink;
  final Color pinkDark;
  final Color white;
  final Color white90;

  const AppColors({
    this.primary = const Color(0xFF16A249),
    this.secondary = const Color(0xFFF0C814),
    this.accent = const Color(0xFF8B5CF6),
    this.error = const Color(0xFFEC4A3A),
    this.lightBackground = const Color(0xFF090A0F),
    this.lightForeground = const Color(0xFFFAFAFA),
    this.lightSecondary = const Color(0xFF282A32),
    this.lightMutedForeground = const Color(0xFFA3A6AC),
    this.lightPrimaryForeground = const Color(0xFFF7F5F5),
    this.darkBackground = const Color(0xFF020817),
    this.darkForeground = const Color(0xFFF8FAFC),
    this.darkSecondary = const Color(0xFF1E293B),
    this.darkMutedForeground = const Color(0xFF94A3B8),
    this.darkPrimaryForeground = const Color(0xFF0F172A),
    this.darkDestructive = const Color(0xFF7F1D1D),
    this.darkRing = const Color(0xFFCBD5E1),
    this.purple = const Color(0xFF8534A1),
    this.orange = const Color(0xFFFBBD36),
    this.black = const Color(0xFF000000),
    this.black80 = const Color(0xFF404040),
    this.grey = const Color(0xFF999999),
    this.green = const Color(0xFF10B981),
    this.greenDeep60 = const Color(0xFF038C5F),
    this.greenDeep = const Color(0xFF1F4739),
    this.pink = const Color(0xFFFF2D55),
    this.pinkDark = const Color(0xFF330606),
    this.white = const Color(0xFFFFFFFF),
    this.white90 = const Color(0xFFFBFBFB),
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? error,
    Color? lightBackground,
    Color? lightForeground,
    Color? lightSecondary,
    Color? lightMutedForeground,
    Color? lightPrimaryForeground,
    Color? darkBackground,
    Color? darkForeground,
    Color? darkSecondary,
    Color? darkMutedForeground,
    Color? darkPrimaryForeground,
    Color? darkDestructive,
    Color? darkRing,
    Color? purple,
    Color? orange,
    Color? black,
    Color? black80,
    Color? grey,
    Color? green,
    Color? greenDeep60,
    Color? greenDeep,
    Color? pink,
    Color? pinkDark,
    Color? white,
    Color? white90,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      error: error ?? this.error,
      lightBackground: lightBackground ?? this.lightBackground,
      lightForeground: lightForeground ?? this.lightForeground,
      lightSecondary: lightSecondary ?? this.lightSecondary,
      lightMutedForeground: lightMutedForeground ?? this.lightMutedForeground,
      lightPrimaryForeground:
      lightPrimaryForeground ?? this.lightPrimaryForeground,
      darkBackground: darkBackground ?? this.darkBackground,
      darkForeground: darkForeground ?? this.darkForeground,
      darkSecondary: darkSecondary ?? this.darkSecondary,
      darkMutedForeground: darkMutedForeground ?? this.darkMutedForeground,
      darkPrimaryForeground:
      darkPrimaryForeground ?? this.darkPrimaryForeground,
      darkDestructive: darkDestructive ?? this.darkDestructive,
      darkRing: darkRing ?? this.darkRing,
      purple: purple ?? this.purple,
      orange: orange ?? this.orange,
      black: black ?? this.black,
      black80: black80 ?? this.black80,
      grey: grey ?? this.grey,
      green: green ?? this.green,
      greenDeep60: greenDeep60 ?? this.greenDeep60,
      greenDeep: greenDeep ?? this.greenDeep,
      pink: pink ?? this.pink,
      pinkDark: pinkDark ?? this.pinkDark,
      white: white ?? this.white,
      white90: white90 ?? this.white90,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      error: Color.lerp(error, other.error, t)!,
      lightBackground: Color.lerp(lightBackground, other.lightBackground, t)!,
      lightForeground: Color.lerp(lightForeground, other.lightForeground, t)!,
      lightSecondary: Color.lerp(lightSecondary, other.lightSecondary, t)!,
      lightMutedForeground: Color.lerp(
          lightMutedForeground, other.lightMutedForeground, t)!,
      lightPrimaryForeground: Color.lerp(
          lightPrimaryForeground, other.lightPrimaryForeground, t)!,
      darkBackground: Color.lerp(darkBackground, other.darkBackground, t)!,
      darkForeground: Color.lerp(darkForeground, other.darkForeground, t)!,
      darkSecondary: Color.lerp(darkSecondary, other.darkSecondary, t)!,
      darkMutedForeground:
      Color.lerp(darkMutedForeground, other.darkMutedForeground, t)!,
      darkPrimaryForeground:
      Color.lerp(darkPrimaryForeground, other.darkPrimaryForeground, t)!,
      darkDestructive:
      Color.lerp(darkDestructive, other.darkDestructive, t)!,
      darkRing: Color.lerp(darkRing, other.darkRing, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      black: Color.lerp(black, other.black, t)!,
      black80: Color.lerp(black80, other.black80, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      green: Color.lerp(green, other.green, t)!,
      greenDeep60: Color.lerp(greenDeep60, other.greenDeep60, t)!,
      greenDeep: Color.lerp(greenDeep, other.greenDeep, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
      pinkDark: Color.lerp(pinkDark, other.pinkDark, t)!,
      white: Color.lerp(white, other.white, t)!,
      white90: Color.lerp(white90, other.white90, t)!,
    );
  }
}


