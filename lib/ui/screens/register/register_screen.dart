import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

final class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacings.lg_40,
            horizontal: AppSpacings.sm_24,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Como podemos\nchamar você?",
                  style: context.typography.textLarge.copyWith(
                    color: context.colors.greenDark,
                  ),
                ),
                const SizedBox(height: AppSpacings.lg_40),
                TextField(
                  style: context.typography.input.copyWith(
                    color: context.colors.gray600,
                  ),
                  cursorColor: context.colors.gray600,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusColor: context.colors.gray600,
                  ),
                ),
                const SizedBox(
                  height: AppSpacings.lg_40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Começar",
                    style: context.typography.button.copyWith(
                      color: context.colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
