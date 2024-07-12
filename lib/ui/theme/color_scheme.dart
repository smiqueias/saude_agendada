import 'package:flutter/material.dart';

final class AppColorScheme {
  /// Principal
  final Color purpleLight;
  final Color purpleBase;
  final Color purpleDark;
  final Color greenLight;
  final Color greenBase;
  final Color greenDark;

  /// Base
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;

  /// Feedback
  final Color danger;

  AppColorScheme({
    required this.purpleLight,
    required this.purpleBase,
    required this.purpleDark,
    required this.greenLight,
    required this.greenBase,
    required this.greenDark,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.gray400,
    required this.gray500,
    required this.gray600,
    required this.danger,
  });

  factory AppColorScheme.light() => AppColorScheme(
        purpleLight: const Color(0xFFDDD2EF),
        purpleBase: const Color(0xFF9359F3),
        purpleDark: const Color(0xFF6F3CC3),
        greenLight: const Color(0xFFBFE3D0),
        greenBase: const Color(0xFF479C6E),
        greenDark: const Color(0xFF2D6C4A),
        gray100: const Color(0xFFF0EDF2),
        gray200: const Color(0xFFE5E2E9),
        gray300: const Color(0xFFE0DCE4),
        gray400: const Color(0xFFD1CBD7),
        gray500: const Color(0xFF6B6572),
        gray600: const Color(0xFF262428),
        danger: const Color(0xFFC2464D),
      );
}
