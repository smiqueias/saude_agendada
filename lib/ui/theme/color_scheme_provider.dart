import 'package:flutter/material.dart';

import 'color_scheme.dart';

final class AppColorSchemeProvider extends InheritedWidget {
  final AppColorScheme appColorScheme;

  AppColorSchemeProvider({
    super.key,
    required this.appColorScheme,
    required WidgetBuilder builder,
  }) : super(child: Builder(builder: builder));

  static AppColorSchemeProvider of(BuildContext context) {
    final scheme =
        context.dependOnInheritedWidgetOfExactType<AppColorSchemeProvider>();

    if (scheme != null) {
      return scheme;
    } else {
      throw Exception("No color scheme");
    }
  }

  @override
  bool updateShouldNotify(AppColorSchemeProvider oldWidget) {
    return oldWidget.appColorScheme != appColorScheme;
  }
}
