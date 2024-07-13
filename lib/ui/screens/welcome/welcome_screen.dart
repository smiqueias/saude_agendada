import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

final class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    /// Example Theme Usage
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: context.colors.gray100,
        child: Center(
          child: Text(
            "TESTE FONTESS",
            style: context.typography.textLarge.copyWith(
              color: context.colors.greenBase,
            ),
          ),
        ),
      ),
    );
  }
}
