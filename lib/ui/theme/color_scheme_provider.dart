import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/theme/typography.dart';

import 'color_scheme.dart';

final class AppThemeProvider extends InheritedWidget {
  final AppColorScheme appColorScheme;
  final AppTypography typography;

  AppThemeProvider({
    super.key,
    required this.appColorScheme,
    required this.typography,
    required WidgetBuilder builder,
  }) : super(child: Builder(builder: builder));

  static AppThemeProvider of(BuildContext context) {
    final scheme =
        context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();

    if (scheme != null) {
      return scheme;
    } else {
      throw Exception("No color scheme");
    }
  }

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) {
    return oldWidget.appColorScheme != appColorScheme;
  }
}
