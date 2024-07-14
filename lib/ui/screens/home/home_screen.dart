import 'package:flutter/material.dart';
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
            horizontal: AppSpacings.sm_24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Olá,\n${_homeViewModel.manager.currentUser?.name ?? '-'}",
                style: context.typography.textLarge.copyWith(
                  color: context.colors.greenDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
