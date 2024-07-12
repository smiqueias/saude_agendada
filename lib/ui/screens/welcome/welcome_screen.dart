import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

final class WelcomeScreen extends StatefulWidget {
  static const routeName = 'WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: context.colors.danger,
    );
  }
}
