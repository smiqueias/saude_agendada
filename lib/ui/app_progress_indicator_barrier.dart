import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

Future<T> showAppProgressIndicatorBarrier<T>({
  required BuildContext context,
  required Future<T> future,
}) async {
  unawaited(showDialog(
    context: context,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: context.colors.gray600,
            ),
          ),
        ),
      );
    },
  ));

  try {
    await Future.wait([
      future,
      Future<void>.delayed(
        const Duration(seconds: 1),
      )
    ]).whenComplete(
      Navigator.of(context).pop,
    );
  } catch (e) {
    rethrow;
  }
  return future;
}
