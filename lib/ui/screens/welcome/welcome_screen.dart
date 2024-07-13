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
    /// Example Theme Usage
    return Scaffold(
      backgroundColor: context.colors.gray100,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 80, left: 42, right: 42),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: context.colors.gray100,
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Gerencie seus medicamentos de forma facil",
                  style: context.typography.textLarge.copyWith(
                    color: context.colors.greenDark,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 29),
                  height: 284,
                  width: 292,
                  color: context.colors.gray300,
                  child: const Center(child: Text('Reservardo para imagem')),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 29),
                  child: Text(
                    'Não esqueça mais de tomar seus remédios.'
                    'Nós cuidamos de lembrar você sempre que precisar.',
                    textAlign: TextAlign.center,
                    style: context.typography.textMd.copyWith(
                      color: context.colors.gray600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 29),
                  child: FloatingActionButton(
                    backgroundColor: context.colors.greenBase,
                    elevation: 2,
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.white,
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
