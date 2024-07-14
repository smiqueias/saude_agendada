import 'package:flutter/material.dart';
import 'package:scheduled_health/coordinator/coordinator.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

final class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Gerencie seus medicamentos de forma facil",
                style: context.typography.textLarge.copyWith(
                  color: context.colors.greenDark,
                ),
              ),
              Container(
                height: 284,
                width: 292,
                color: context.colors.gray300,
                child: const Center(child: Text('Reservardo para imagem')),
              ),
              const SizedBox(height: AppSpacings.md_32),
              Column(
                children: [
                  Text(
                    'Não esqueça mais de tomar seus remédios.'
                    'Nós cuidamos de lembrar você sempre que precisar.',
                    textAlign: TextAlign.center,
                    style: context.typography.textMd.copyWith(
                      color: context.colors.gray600,
                    ),
                  ),
                  const SizedBox(height: AppSpacings.md_32),
                  FloatingActionButton(
                    backgroundColor: context.colors.greenBase,
                    elevation: 2,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.register.route,
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.white,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom +
                        AppSpacings.sm_24,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
