import 'package:flutter/cupertino.dart';
import 'package:scheduled_health/ui/theme/color_scheme.dart';
import 'package:scheduled_health/ui/theme/color_scheme_provider.dart';

extension ThemeExtension on BuildContext {
  AppColorScheme get colors => AppColorSchemeProvider.of(this).appColorScheme;
}
