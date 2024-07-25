import 'package:flutter/material.dart';
import 'package:scheduled_health/coordinator/coordinator.dart';
import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/core/di.dart';
import 'package:scheduled_health/ui/screens/home/home_view_model.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel(
      appManager: coreLayerGetIt<AppManager>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacings.lg_40,
            horizontal: AppSpacings.xs_16,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Olá,\n${_homeViewModel.manager.currentUser?.name ?? ''}",
                  style: context.typography.textLarge.copyWith(
                    color: context.colors.greenDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSpacings.xxs_8),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.colors.greenLight,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: AppSpacings.xxs_4,
                      left: AppSpacings.xxs_8,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Medicamentos de hoje',
                          style: context.typography.button,
                        ),
                        const Text('0 de 5 medicamentos consumidos'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSpacings.xxs_8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Resumo de hoje',
                    style: context.typography.input,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: context.colors.greenSplash,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addMedicine.route);
          },
          child: const Icon(Icons.add)),
    );
  }
}
