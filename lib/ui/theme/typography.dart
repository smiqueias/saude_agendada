import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/constants/constants.dart';

final class AppFontSize {
  final double xs_12;
  final double xl_14;
  final double sm_16;
  final double md_32;

  AppFontSize({
    required this.xs_12,
    required this.xl_14,
    required this.sm_16,
    required this.md_32,
  });

  AppFontSize copyWith({
    double? xs_12,
    double? xl_14,
    double? sm_16,
    double? md_32,
  }) {
    return AppFontSize(
      xs_12: xs_12 ?? this.xs_12,
      xl_14: xl_14 ?? this.xl_14,
      sm_16: sm_16 ?? this.sm_16,
      md_32: md_32 ?? this.md_32,
    );
  }
}

final class AppFontWeight {
  final FontWeight regular;
  final FontWeight bold;
  final FontWeight semibold;

  AppFontWeight({
    required this.regular,
    required this.bold,
    required this.semibold,
  });

  AppFontWeight copyWith({
    FontWeight? regular,
    FontWeight? bold,
    FontWeight? semibold,
  }) {
    return AppFontWeight(
      regular: regular ?? this.regular,
      bold: bold ?? this.bold,
      semibold: semibold ?? this.semibold,
    );
  }
}

final class AppLineHeight {
  final double small;

  final double large;

  AppLineHeight({
    required this.small,
    required this.large,
  });

  AppLineHeight copyWith({
    double? small,
    double? large,
  }) {
    return AppLineHeight(
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }
}

const _baseTextStyle = TextStyle(
  fontFamily: fontFamily,
);

final class AppTypography {
  final String fontFamily;
  final AppFontSize fontSize;
  final AppFontWeight fontWeight;
  final AppLineHeight lineHeight;

  final TextStyle input;
  final TextStyle button;
  final TextStyle subtitle;
  final TextStyle tag;
  final TextStyle textMd;
  final TextStyle textLarge;
  final TextStyle textMdDone;
  final TextStyle textSm;
  final TextStyle textSmDone;

  AppTypography({
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight,
    required this.lineHeight,
  })  : input = _baseTextStyle.copyWith(
          fontSize: fontSize.sm_16,
          fontWeight: fontWeight.regular,
          fontFamily: fontFamily,
          height: lineHeight.large,
        ),
        textLarge = _baseTextStyle.copyWith(
          fontSize: fontSize.md_32,
          fontWeight: fontWeight.bold,
          fontFamily: fontFamily,
          height: lineHeight.large,
        ),
        button = _baseTextStyle.copyWith(
          fontSize: fontSize.sm_16,
          fontWeight: fontWeight.bold,
          fontFamily: fontFamily,
          height: lineHeight.large,
        ),
        subtitle = _baseTextStyle.copyWith(
          fontSize: fontSize.xl_14,
          fontWeight: fontWeight.semibold,
          fontFamily: fontFamily,
          height: lineHeight.small,
        ),
        tag = _baseTextStyle.copyWith(
          fontSize: fontSize.xs_12,
          fontWeight: fontWeight.bold,
          fontFamily: fontFamily,
          height: lineHeight.small,
        ),
        textMd = _baseTextStyle.copyWith(
          fontSize: fontSize.xl_14,
          fontWeight: fontWeight.regular,
          fontFamily: fontFamily,
        ),
        textMdDone = _baseTextStyle.copyWith(
          fontSize: fontSize.xl_14,
          fontWeight: fontWeight.regular,
          decoration: TextDecoration.underline,
          fontFamily: fontFamily,
          height: lineHeight.large,
        ),
        textSm = _baseTextStyle.copyWith(
          fontSize: fontSize.xs_12,
          fontWeight: fontWeight.regular,
          fontFamily: fontFamily,
          height: lineHeight.large,
        ),
        textSmDone = _baseTextStyle.copyWith(
          fontSize: fontSize.xs_12,
          fontWeight: fontWeight.regular,
          decoration: TextDecoration.underline,
          fontFamily: fontFamily,
          height: lineHeight.large,
        );
}
