import 'package:flutter/cupertino.dart';
import 'package:scheduled_health/ui/theme/color_scheme.dart';
import 'package:scheduled_health/ui/theme/color_scheme_provider.dart';
import 'package:scheduled_health/ui/theme/typography.dart';

extension ThemeExtension on BuildContext {
  AppColorScheme get colors => AppThemeProvider.of(this).appColorScheme;
  AppTypography get typography => AppThemeProvider.of(this).typography;
}
